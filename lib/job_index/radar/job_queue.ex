defmodule Jin.Radar.JobQueue do
  @moduledoc """
  A GenServer that processes a list of items

  Used to generate work queues. Concrete implementations must implement the
  `processor/1` callback to provide a means of processing the items in the queue.

  `processor/1` should return a tuple of the form `{result, remaining}` where
  `result` is any value expected by callers (usually the number of remaining
  results) and `remaining` is a list of items that were not processed (which
  could just be an empty list) to form the new state of the server.
  """

  @callback processor([any]) :: {any, any}
  defmacro __using__(_opts) do
    quote location: :keep do
      use GenServer
      alias Jin.Radar.JobQueue
      @behaviour JobQueue

      ##############
      # Client API

      @doc """
      Starts the server with an empty list as the initial state
      """
      @spec start_link(any) :: :ignore | {:error, any} | {:ok, pid}
      def start_link(_) do
        GenServer.start_link(__MODULE__, [], name: __MODULE__)
      end

      @doc """
      Add a job to the queue
      """
      @spec add(any) :: :ok
      def add(items) do
        GenServer.call(__MODULE__, {:add, items})
      end

      @doc """
      Calls the processor method provided by concrete implementations of this
      Macro.
      """
      @spec process() :: :ok | :error
      def process, do: GenServer.call(__MODULE__, :process)

      @doc """
      Resets the state of the server
      """
      @spec reset() :: :ok
      def reset, do: GenServer.call(__MODULE__, :reset)

      @doc """
      Returns current state of the server
      """
      @spec state() :: list(list(any))
      def state, do: :sys.get_state(__MODULE__)

      @impl JobQueue
      @spec processor([any]) :: {any, any}
      def processor(_), do: {:ok, []}

      defoverridable processor: 1

      ##############
      # Server API

      @impl true
      def init(state), do: {:ok, state}

      @impl true
      def handle_call({:add, items}, _from, state), do: {:reply, :ok, [items | state]}

      def handle_call(:reset, _from, _), do: {:reply, :ok, []}

      def handle_call(:process, _from, []), do: {:reply, :ok, []}

      def handle_call(:process, _from, items) do
        {result, remaining} = items |> List.flatten() |> processor()

        {:reply, result, remaining}
      end
    end
  end
end

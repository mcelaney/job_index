defmodule Jin.Radar.Timer do
  @moduledoc """
  GenServer which handles the scheduling of all crawler activity for Astor Wine
  """
  use GenServer
  import Jin.Radar.Timer.Intervals

  @doc """
  Initializes the server and schedules.
  """
  @spec start_link(any) :: GenServer.on_start()
  def start_link(_), do: GenServer.start_link(__MODULE__, [], name: __MODULE__)

  @doc """
  Will repeatedly call the given function every minute until the function returns 0.

  Functions passed to this method should return the number of items remaining to
  be processed expressed as an non-negative integer.
  """
  @spec every_minute(function) :: any
  def every_minute(function) do
    function.()

    Process.send_after(__MODULE__, {:every_minute, function}, one_minute())
  end

  @doc """
  Will repeatedly call the given function every hour.
  """
  @spec every_hour(function) :: any
  def every_hour(function) do
    function.()

    Process.send_after(__MODULE__, {:every_hour, function}, one_hour())
  end

  @doc """
  Will repeatedly call the given function every day at a consistant midnight.
  """
  @spec every_day(function) :: any
  def every_day(function) do
    function.()

    Process.send_after(__MODULE__, {:every_day, function}, today_at_midnight())
  end

  @impl true
  def init(_) do
    {:ok, nil}
  end

  @impl true
  def handle_info({:every_minute, function}, _state) do
    every_minute(function)

    {:noreply, nil}
  end

  def handle_info({:every_hour, function}, _state) do
    every_hour(function)

    {:noreply, nil}
  end

  def handle_info({:every_day, function}, _state) do
    every_day(function)

    {:noreply, nil}
  end
end

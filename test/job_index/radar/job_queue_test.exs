defmodule Jin.Radar.JobQueueTest do
  use ExUnit.Case
  alias Jin.Radar.JobQueue
  alias Jin.Radar.JobQueueTest.Tester

  describe "GenServer" do
    setup do
      start_supervised(Tester)
      :ok
    end

    test "starts with an empty state" do
      assert [] == Tester.state()
    end

    test "Will add a list of items to the state" do
      assert :ok == Tester.add(["1", "2", "3"])
      assert [["1", "2", "3"]] == Tester.state()
    end

    test "Will add a single item to the state" do
      assert :ok == Tester.add("1")
      assert ["1"] == Tester.state()
    end

    test "Will call the processor method if items are in state" do
      assert :ok == Tester.add("1")
      assert :called == Tester.process()
    end

    test "Will not call the processor method if no items are in state" do
      assert :ok == Tester.process()
    end

    test "Will flatten the state if the processor is called" do
      assert :ok == Tester.add(["1", "2", "3"])
      assert :ok == Tester.add(["4", "5", "6"])
      assert :called == Tester.process()
      assert ["4", "5", "6", "1", "2", "3"] == Tester.state()
    end

    test "Will reset the state" do
      assert :ok == Tester.add("1")
      assert ["1"] == Tester.state()
      assert :ok == Tester.reset()
      assert [] == Tester.state()
    end
  end

  defmodule Tester do
    use Jin.Radar.JobQueue

    @impl JobQueue
    def processor(items) do
      {:called, items}
    end
  end
end

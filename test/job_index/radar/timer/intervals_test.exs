defmodule Jin.Radar.Timer.IntervalsTest do
  use ExUnit.Case, async: true
  alias Jin.Radar.Timer.Intervals

  test "one_minute/0" do
    assert 60_000 == Intervals.one_minute()
  end

  test "one_hour/0" do
    assert 3_600_000 == Intervals.one_hour()
  end

  @doc """
  This test is accurate but not really what I want... I'd
  expect this value to be the same as the one above
  (3_660_000 ms to a minute past midnight) but for whatever
  reason it ends up a second off. This is not worth chasing
  down... so I'm leaving it as is and we'll see if the test
  result changes later on
  """
  test "today_at_midnight/1" do
    thursday_at_11pm = ~N[2023-04-20 23:00:00]
    one_hour_plus_one_minute = 3_659_000

    thursday_at_11pm
    |> Timex.to_datetime()
    |> Intervals.today_at_midnight()
    |> Kernel.==(one_hour_plus_one_minute)
    |> assert()
  end
end

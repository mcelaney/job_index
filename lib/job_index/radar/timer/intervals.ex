defmodule Jin.Radar.Timer.Intervals do
  @moduledoc """
  Produces time values in milliseconds for use in scheduling
  """

  @doc """
  Number of milliseconds in one minute
  """
  def one_minute, do: 60_000

  @doc """
  Number of milliseconds in one hour
  """
  def one_hour, do: 60 * one_minute()

  @doc """
  Number of milliseconds until midnight today

  Actually returns one minute after midnight to ensure any follow-on timers find
  the correct next time period
  """
  def today_at_midnight(now \\ Timex.now()) do
    now
    |> Timex.end_of_day()
    |> Timex.diff(now, :millisecond)
    |> Kernel.+(one_minute())
  end
end

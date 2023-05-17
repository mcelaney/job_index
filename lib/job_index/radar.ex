defmodule Jin.Radar do
  @moduledoc """
  Context responsible for processing the current state of the careers pages we're
  tracking.
  """

  alias Jin
  @type url :: Jin.url()

  @doc """
  Takes a list of urls eacxh representing the start point of a crawl and sets up
  an asyncronous crawl of the available data for each one.

  ## Examples

      iex> Jin.Radar.ping([[
      ...>   "https://jobs.lever.co/bainbridge-health",
      ...>   "https://boards.greenhouse.io/boulevard/",
      ...>   "https://jobs.lever.co/rupa",
      ...>   "https://boards.greenhouse.io/twilio"
      ...> ])

      :ok
  """
  @spec ping([url]) :: :obviously_wrong
  def ping(_base_urls), do: :ok
end

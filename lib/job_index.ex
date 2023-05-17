defmodule Jin do
  @moduledoc """
  Jin is a job index that crawls careers pages and indexes the jobs it finds.
  """

  @typedoc """
  Expected to be a fully qualified external url.  For example:
  https://www.example.com/careers
  """
  @type url :: String.t()
end

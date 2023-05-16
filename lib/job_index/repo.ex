defmodule Jin.Repo do
  use Ecto.Repo,
    otp_app: :job_index,
    adapter: Ecto.Adapters.Postgres
end

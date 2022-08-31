defmodule Mondriaan.Repo do
  use Ecto.Repo,
    otp_app: :mondriaan,
    adapter: Ecto.Adapters.Postgres
end

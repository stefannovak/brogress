defmodule Brogress.Repo do
  use Ecto.Repo,
    otp_app: :brogress,
    adapter: Ecto.Adapters.Postgres
end

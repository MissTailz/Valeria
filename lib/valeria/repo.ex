defmodule Valeria.Repo do
  use Ecto.Repo,
    otp_app: :valeria,
    adapter: Ecto.Adapters.Postgres
end

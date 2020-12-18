use Mix.Config

config :nostrum,
  token: System.get_env("TOKEN"),
  num_shards: :auto

config :valeria, Valeria.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true

import_config "#{Mix.env()}.exs"

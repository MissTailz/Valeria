use Mix.Config

config :nostrum,
  token: "Nzg5MTgyODk2NTI2MTk2NzM2.X9uV2A.ZMduaX1FVXvIkzUxGxSCcP7qnmM",
  num_shards: :auto

config :valeria, Valeria.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true

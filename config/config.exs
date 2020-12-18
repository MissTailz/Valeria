use Mix.Config

config :nostrum,
  token: "Nzg5MTgyODk2NTI2MTk2NzM2.X9uV2A.ZMduaX1FVXvIkzUxGxSCcP7qnmM",
  num_shards: :auto

config :porcelain, driver: Porcelain.Driver.Basic

config :valeria, Valeria.Repo,
  username: "postgres",
  password: "@Sdftails",
  database: "Valeria",
  hostname: "127.0.0.1"

config :valeria, ecto_repos: [Valeria.Repo]

import_config "#{Mix.env()}.exs"

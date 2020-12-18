use Mix.Config

config :nostrum,
  token: System.get_env("TOKEN"),
  num_shards: :auto

config :porcelain, driver: Porcelain.Driver.Basic

config :valeria, Valeria.Repo,
  username: "postgres",
  password: "@Sdftails",
  database: "Valeria",
  hostname: "127.0.0.1"

config :valeria, ecto_repos: [Valeria.Repo]

import_config "#{Mix.env()}.exs"

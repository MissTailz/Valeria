defmodule Valeria.Application do
  use Application

  def start(_type, _args) do
    children = [
      Valeria.Consumer,
      Valeria.Repo
    ]

    options = [strategy: :one_for_one, name: Valeria.Supervisor]
    Supervisor.start_link(children, options)
  end
end

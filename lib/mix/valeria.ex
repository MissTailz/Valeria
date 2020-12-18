defmodule Mix.Tasks.Valeria.Start do
  use Mix.Task

  @moduledoc """
  Starts the Discord bot with `--no-halt` automatically added!
  """
  @doc false
  def run(_args) do
    Mix.Tasks.Run.run(["--no-halt"])
  end
end

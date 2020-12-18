defmodule Valeria.Event.StarRemove do
  def perform(reaction) do
    IO.puts(reaction.emoji.name)
  end
end

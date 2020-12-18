defmodule Valeria.Event.StarAdd do
  def perform(reaction) do
    IO.puts(reaction.emoji.name)
  end
end

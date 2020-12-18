defmodule Valeria.Command.Help do
  @behaviour Valeria.Command
  def perform(_arguments, _message) do
    {:ok, number} = Valeria.Native.add(1, 2)
    IO.puts to_string(number)
  end
end

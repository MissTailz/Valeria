defmodule Valeria.Command do
  @command_prefix "!"

  def handle_message(message) do
    {command, arguments} =
      message.content
      |> String.replace_prefix(@command_prefix, " ")
      |> String.trim_leading()
      |> String.downcase()
      |> String.split(" ")
      |> List.pop_at(0)

    alias Valeria.Command.{
      Help,
      Karma
    }

    case command do
      "help" ->
        Help.perform(arguments, message)

      "karma" ->
        Karma.perform(arguments, message)

      _ ->
        :ok
    end
  end

  @callback perform(arguments :: list(String.t()), message :: %Nostrum.Struct.Message{}) :: :ok
end

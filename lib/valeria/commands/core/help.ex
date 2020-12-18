defmodule Valeria.Command.Help do
  @behaviour Valeria.Command
  def perform(_arguments, message) do
    alias Nostrum.Api
    Api.create_message(message.channel_id, "no")
  end
end

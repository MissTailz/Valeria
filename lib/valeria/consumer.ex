defmodule Valeria.Consumer do
  use Nostrum.Consumer

  alias Valeria.Command
  alias Valeria.Event

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event(event) do
    case event do
      {:MESSAGE_CREATE, message, _ws_state} ->
        Command.handle_message(message)

      {:MESSAGE_REACTION_ADD, reaction, _ws_state} ->
        Event.handle_reaction_add(reaction)

      {:MESSAGE_REACTION_REMOVE, reaction, _ws_state} ->
        Event.handle_reaction_remove(reaction)

      {:MESSAGE_UPDATE, message, _ws_state} ->
        Event.handle_message_update(message)

      {:READY, bot, _ws_state} ->
        Event.handle_on_ready(bot)

      _ ->
        :noop
    end
  end
end

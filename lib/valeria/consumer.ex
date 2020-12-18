defmodule Valeria.Consumer do
  use Nostrum.Consumer

  alias Valeria.Command
  alias Valeria.Event

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:MESSAGE_CREATE, message, _ws_state}) do
    Command.handle_message(message)
  end

  def handle_event({:MESSAGE_REACTION_ADD, reaction, _ws_state}) do
    Event.handle_reaction_add(reaction)
  end

  def handle_event({:MESSAGE_REACTION_REMOVE, reaction, _ws_state})do
    Event.handle_reaction_remove(reaction)
  end
  def handle_event(_event) do
    :noop
  end
end

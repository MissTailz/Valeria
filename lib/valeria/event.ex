defmodule Valeria.Event do
  alias Valeria.Command
  alias Nostrum.Api

  alias Valeria.Event.{
    UpvoteAdd,
    UpvoteRemove,
    DownvoteAdd,
    DownvoteRemove
    # StarAdd, message_emoji_add
    # StarRemove
  }

  def handle_message_update(message) do
    Command.handle_message(message)
  end

  def handle_reaction_add(reaction) do
    name =
      reaction.emoji.name
      |> String.downcase()

    case name do
      "upvote" ->
        UpvoteAdd.perform(reaction)

      "downvote" ->
        DownvoteAdd.perform(reaction)

      _ ->
        :ok
    end
  end

  def handle_reaction_remove(reaction) do
    name =
      reaction.emoji.name
      |> String.downcase()

    case name do
      "upvote" ->
        UpvoteRemove.perform(reaction)

      "downvote" ->
        DownvoteRemove.perform(reaction)

      _ ->
        :ok
    end
  end

  def handle_on_ready(bot) do
    Api.update_status(:online, "Nothing", 1, "https://twitch.tv/mstailz")
    IO.puts("#{bot.user.username} Is online!")
  end
end

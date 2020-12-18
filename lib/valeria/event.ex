defmodule Valeria.Event do
  alias Valeria.Event.{
    UpvoteAdd,
    UpvoteRemove,
    DownvoteAdd,
    DownvoteRemove,
    StarAdd,
    StarRemove,
  }

  def handle_reaction_add(reaction) do
    name =
      reaction.emoji.name
      |> String.downcase()

    case name do
      "upvote" ->
        UpvoteAdd.perform(reaction)

      "downvote" ->
        DownvoteAdd.perform(reaction)

      "star" ->
        StarAdd.perform(reaction)

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

      "star" ->
        StarRemove.perform(reaction)

      _ ->
        :ok
    end
  end
end

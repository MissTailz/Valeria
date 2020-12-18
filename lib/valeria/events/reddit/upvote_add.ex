defmodule Valeria.Event.UpvoteAdd do
  alias Nostrum.Api
  alias Valeria.Reddit

  def perform(reaction) do
    {:ok, message} = Api.get_channel_message(reaction.channel_id, reaction.message_id)
    user = Reddit.get_user(message.author.id)

    case user do
      nil -> Reddit.create_user(%{id: message.author.id, karma: 1})
      _ -> Reddit.update_user(user, %{karma: user.karma + 1})
    end
  end
end

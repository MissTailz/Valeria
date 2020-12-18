defmodule Valeria.Event.DownvoteAdd do
  alias Nostrum.Api
  alias Valeria.Reddit

  def perform(reaction) do
    {:ok, message} = Api.get_channel_message(reaction.channel_id, reaction.message_id)
    author = message.author.id
    user = Reddit.get_user(author)

    if user == nil do
      Reddit.create_user(%{id: author, karma: 1})
    else
      Reddit.update_user(user, %{karma: user.karma - 1})
    end
  end
end

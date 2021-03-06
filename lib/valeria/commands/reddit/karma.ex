defmodule Valeria.Command.Karma do
  @behaviour Valeria.Command
  def perform(_arguments, message) do
    alias Nostrum.Api
    alias Valeria.Reddit
    author = message.author.id
    user = Reddit.get_user(author)

    if user == nil do
      Reddit.create_user(%{id: author, karma: 1})
    end

    Api.create_message(message.channel_id,
      file:
        Valeria.Native.draw_reddit_profile(
          to_string(user.karma),
          message.author.username,
          message.author.avatar,
          message.author.id
        )
    )

    :ok
  end
end

defmodule Valeria.Command.Karma do
  @behaviour Valeria.Command
  def perform(_arguments, message) do
    alias Nostrum.Api
    alias Valeria.Reddit
    author = message.author.id
    user = Reddit.get_user(author)

    case user do
      nil -> Reddit.create_user(%{id: author, karma: 1})
      _ -> :ok
    end

    Api.create_message(message.channel_id,
      file:
        Valeria.Native.draw_reddit_profile(
          Reddit.get_user(author).karma,
          message.author.username
        )
    )

    :ok
  end
end

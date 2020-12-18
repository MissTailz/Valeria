defmodule Valeria.Reddit do
  import Ecto.Query, warn: false
  alias Valeria.Repo
  alias Valeria.Reddit.RedditUser

  def list_users do
    Repo.all(RedditUser)
  end

  def get_user(id), do: Repo.get(RedditUser, id)

  def create_user(attrs \\ %{}) do
    %RedditUser{}
    |> RedditUser.changeset(attrs)
    |> Repo.insert()
  end

  def update_user(%RedditUser{} = user, attrs) do
    user
    |> RedditUser.changeset(attrs)
    |> Repo.update()
  end
end

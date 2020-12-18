defmodule Valeria.Reddit.RedditUser do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reddit_users" do
    field(:karma, :integer, default: 1)
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:id, :karma])
    |> validate_required([:id, :karma])
  end
end

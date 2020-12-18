defmodule Valeria.Repo.Migrations.CreateRedditUser do
  use Ecto.Migration

  def change do
    create table(:reddit_users) do
      add(:karma, :integer, default: 1)
    end
  end
end

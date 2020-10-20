defmodule Chirp1.Repo.Migrations.CreateBoards do
  use Ecto.Migration

  def change do
    create table(:boards) do
      add :title, :string
      add :username, :string
      add :content, :string
      add :likes_count, :integer

      timestamps()
    end

  end
end

defmodule Chirp1.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :title, :string
      add :body, :text

      timestamps()
    end

  end
end

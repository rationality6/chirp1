defmodule Chirp1.Boards.Board do
  use Ecto.Schema
  import Ecto.Changeset

  schema "boards" do
    field :content, :string
    field :likes_count, :integer
    field :title, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(board, attrs) do
    board
    |> cast(attrs, [:title, :username, :content, :likes_count])
    |> validate_required([:title, :username, :content, :likes_count])
  end
end

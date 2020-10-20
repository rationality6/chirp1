defmodule Chirp1.BoardsTest do
  use Chirp1.DataCase

  alias Chirp1.Boards

  describe "boards" do
    alias Chirp1.Boards.Board

    @valid_attrs %{content: "some content", likes_count: 42, title: "some title", username: "some username"}
    @update_attrs %{content: "some updated content", likes_count: 43, title: "some updated title", username: "some updated username"}
    @invalid_attrs %{content: nil, likes_count: nil, title: nil, username: nil}

    def board_fixture(attrs \\ %{}) do
      {:ok, board} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Boards.create_board()

      board
    end

    test "list_boards/0 returns all boards" do
      board = board_fixture()
      assert Boards.list_boards() == [board]
    end

    test "get_board!/1 returns the board with given id" do
      board = board_fixture()
      assert Boards.get_board!(board.id) == board
    end

    test "create_board/1 with valid data creates a board" do
      assert {:ok, %Board{} = board} = Boards.create_board(@valid_attrs)
      assert board.content == "some content"
      assert board.likes_count == 42
      assert board.title == "some title"
      assert board.username == "some username"
    end

    test "create_board/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Boards.create_board(@invalid_attrs)
    end

    test "update_board/2 with valid data updates the board" do
      board = board_fixture()
      assert {:ok, %Board{} = board} = Boards.update_board(board, @update_attrs)
      assert board.content == "some updated content"
      assert board.likes_count == 43
      assert board.title == "some updated title"
      assert board.username == "some updated username"
    end

    test "update_board/2 with invalid data returns error changeset" do
      board = board_fixture()
      assert {:error, %Ecto.Changeset{}} = Boards.update_board(board, @invalid_attrs)
      assert board == Boards.get_board!(board.id)
    end

    test "delete_board/1 deletes the board" do
      board = board_fixture()
      assert {:ok, %Board{}} = Boards.delete_board(board)
      assert_raise Ecto.NoResultsError, fn -> Boards.get_board!(board.id) end
    end

    test "change_board/1 returns a board changeset" do
      board = board_fixture()
      assert %Ecto.Changeset{} = Boards.change_board(board)
    end
  end
end

defmodule Chirp1Web.PageLiveTest do
  use Chirp1Web.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Welcome to Phoenix!"
    assert render(page_live) =~ "Welcome to Phoenix!"
  end

  test "뭐든 잡는지?", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Peace of mind from prototype to production"
    assert render(page_live) =~ "Peace of mind from prototype to production"
  end
end

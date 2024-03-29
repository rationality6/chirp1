defmodule Chirp1Web.PostLive.PostComponent do
  use Chirp1Web, :live_component

  def render(assigns) do
    ~L"""
    <div class="">
      <span class="">
        id: <%= @id %>
        <%= @post.username %>
      </span>

      <span class="">
        <%= @post.body %>
      </span>

      <span class="css_button">
        <a href="#" phx-click="like" phx-target="<%= @myself %>">
          likes_count: <%= @post.likes_count %>
        </a>
      </span>

      <span class="">
        <a href="#" phx-click="repost" phx-target="<%= @myself %>">
          reposts_count:
        <%= @post.reposts_count %>
        </a>
      </span>

      <span class="">
        <%= live_patch to: Routes.post_index_path(@socket, :edit, @post.id) do %>
          -
        <% end %>
      </span>

      <span class="">
        <%= link to: '#', phx_click: "delete", phx_value_id: @post.id do %>
          x
        <% end %>
      </span>



    </div>
    """
  end

  def handle_event("like", _, socket) do
    Chirp1.Timeline.inc_likes(socket.assigns.post)
    {:noreply, socket}
  end

  def handle_event("repost", _, socket) do
    Chirp1.Timeline.inc_reposts(socket.assigns.post)
    {:noreply, socket}
  end
end

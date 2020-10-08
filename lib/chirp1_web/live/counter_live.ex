defmodule Chirp1Web.CounterLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    socket = assign(socket, :count, 0)
    socket = assign(socket, :count1, 0)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
      <h1>Count: <%= @count %></h1>
      <h1>Count1: <%= @count1 %></h1>
      <div class="">
        <button phx-click="reset_count">
          reset
        </button>
        <button phx-click="increment">
          +
        </button>
        <button phx-click="decrement">
          -
        </button>
        <button phx-click="multiply">
          *
        </button>
      </div>
      <div class="">
      <button phx-click="reset_count">
        reset
      </button>
      <button phx-click="increment">
        +
      </button>
      <button phx-click="decrement">
        -
      </button>
      <button phx-click="multiply">
        *
      </button>
      </div>

    """
  end

  def handle_event("increment", _, socket) do
    count = socket.assigns.count + 1
    socket = assign(socket, :count, count)
    {:noreply, socket}
  end

  def handle_event("decrement", _, socket) do
    count = socket.assigns.count - 1
    socket = assign(socket, :count, count)
    {:noreply, socket}
  end

  def handle_event("multiply", _, socket) do
    count = socket.assigns.count * 2
    socket = assign(socket, :count, count)
    {:noreply, socket}
  end

  def handle_event("reset_count", _, socket) do
    count = 0
    socket = assign(socket, :count, count)
    {:noreply, socket}
  end
end

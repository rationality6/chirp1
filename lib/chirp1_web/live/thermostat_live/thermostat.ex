defmodule Chirp1Web.ThermostatLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div class="">
      <%= @temperature %>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    socket = assign(socket, :temperature, 0)
    {:ok, assign(socket, query: "", results: %{})}
  end
end

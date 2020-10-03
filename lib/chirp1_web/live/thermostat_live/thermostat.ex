defmodule Chirp1Web.Thermostat do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div class="">
      <%= @temperature %>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", results: %{})}
  end
end

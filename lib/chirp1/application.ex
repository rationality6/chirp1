defmodule Chirp1.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Chirp1.Repo,
      # Start the Telemetry supervisor
      Chirp1Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Chirp1.PubSub},
      # Start the Endpoint (http/https)
      Chirp1Web.Endpoint
      # Start a worker by calling: Chirp1.Worker.start_link(arg)
      # {Chirp1.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Chirp1.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Chirp1Web.Endpoint.config_change(changed, removed)
    :ok
  end
end

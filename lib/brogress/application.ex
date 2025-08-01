defmodule Brogress.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BrogressWeb.Telemetry,
      Brogress.Repo,
      {DNSCluster, query: Application.get_env(:brogress, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Brogress.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Brogress.Finch},
      # Start a worker by calling: Brogress.Worker.start_link(arg)
      # {Brogress.Worker, arg},
      # Start to serve requests, typically the last entry
      BrogressWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Brogress.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BrogressWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

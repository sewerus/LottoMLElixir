defmodule LottoPhoenix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LottoPhoenixWeb.Telemetry,
      LottoPhoenix.Repo,
      {DNSCluster, query: Application.get_env(:lotto_phoenix, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: LottoPhoenix.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: LottoPhoenix.Finch},
      # Start a worker by calling: LottoPhoenix.Worker.start_link(arg)
      # {LottoPhoenix.Worker, arg},
      # Start to serve requests, typically the last entry
      LottoPhoenixWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LottoPhoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LottoPhoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

defmodule MinimalServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args), do: Supervisor.start_link(children(), opts())

  defp children() do
    [
      # Starts a worker by calling: MinimalServer.Worker.start_link(arg)
      # {MinimalServer.Worker, arg},
      {MinimalServer.Endpoint, []}
    ]
  end

  defp opts() do
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    [strategy: :one_for_one, name: MinimalServer.Supervisor]
  end

end

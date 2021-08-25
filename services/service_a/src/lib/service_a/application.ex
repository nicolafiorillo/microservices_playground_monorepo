defmodule ServiceA.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    IO.puts("Listening port #{Utils.port()}")

    children = [
      {Plug.Cowboy, scheme: :http, plug: Router, options: [port: Utils.port()]}
      # Starts a worker by calling: ServiceA.Worker.start_link(arg)
      # {ServiceA.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ServiceA.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

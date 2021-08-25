defmodule Utils do
  def port, do: Application.get_env(:service_a, :cowboy_port, 8080)
end

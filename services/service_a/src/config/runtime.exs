import Config

config :service_a, cowboy_port: (System.get_env("PORT") || "8080") |> String.to_integer()

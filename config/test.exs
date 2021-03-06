use Mix.Config

config :coffee, Coffee.Endpoint,
  http: [port: System.get_env("PORT") || 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

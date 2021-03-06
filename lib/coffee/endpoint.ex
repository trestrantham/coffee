defmodule Coffee.Endpoint do
  use Phoenix.Endpoint, otp_app: :coffee

  plug Plug.Static,
    at: "/", from: :coffee

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_coffee_key",
    signing_salt: "73s3DHU+",
    encryption_salt: "MjCBHMkI"

  plug :router, Coffee.Router
end

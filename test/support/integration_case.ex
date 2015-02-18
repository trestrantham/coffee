defmodule IntegrationCase do
  use ExUnit.CaseTemplate

  using(_) do
    quote do
      use TucoTuco.DSL
    end
  end

  setup_all do
    {:ok, _} = TucoTuco.start_session :test_browser, :test_session, :phantomjs

    host = Coffee.Endpoint.config(:url)[:host]
    port = Coffee.Endpoint.config(:http)[:port]

    TucoTuco.app_root "http://#{host}:#{port}"

    on_exit fn ->
      TucoTuco.stop
    end
  end
end

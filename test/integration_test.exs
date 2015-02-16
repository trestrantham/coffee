defmodule IntegrationTest do
  use ExUnit.Case
  use TucoTuco.DSL

  setup_all do
    {:ok, _} = TucoTuco.start_session :test_browser, :test_session, :phantomjs

    host = Coffee.Endpoint.config(:url)[:host]
    port = Coffee.Endpoint.config(:http)[:port]

    TucoTuco.app_root "http://#{host}:#{port}"

    on_exit fn ->
      TucoTuco.stop
    end
  end

  test "the truth" do
    visit TucoTuco.app_root

    assert current_url == "http://localhost:4001/"
    assert Page.has_text? "Phoenix"
  end
end

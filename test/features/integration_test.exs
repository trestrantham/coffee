defmodule IntegrationTest do
  use IntegrationCase, async: true

  test "the truth" do
    visit TucoTuco.app_root

    assert current_url == "http://localhost:4001/"
    assert Page.has_text? "Phoenix"
  end
end

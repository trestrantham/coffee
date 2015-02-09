defmodule Factory do
  use Blacksmith

  register :user,
    name: "foo",
    email: "bar",
    roles: []
end

ExUnit.start

# require all support files
Path.join(__DIR__, "/support/**/*.{ex,exs}")
|> Path.wildcard
|> Enum.each fn(f) ->
  Code.require_file f
end

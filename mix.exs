defmodule Coffee.Mixfile do
  use Mix.Project

  def project do
    [
      app: :coffee,
      version: "0.0.1",
      elixir: "~> 1.0",
      elixirc_paths: ["lib", "web"],
      compilers: [:phoenix] ++ Mix.compilers,
      deps: deps(Mix.env),
      test_coverage: [tool: ExCoveralls]
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      mod: {Coffee, []},
      applications: applications(Mix.env)
    ]
  end

  defp applications(:prod) do
    [:phoenix, :cowboy, :logger]
  end
  defp applications(:test) do
    applications(:all) ++ [:blacksmith]
  end
  defp applications(:dev) do
    applications(:test)
  end
  defp applications(_) do
    applications(:prod)
  end

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps(:prod) do
    [
      {:phoenix, "~> 0.8.0"},
      {:cowboy, "~> 1.0"}
    ]
  end
  defp deps(:test) do
    deps(:prod) ++ [
      {:blacksmith, git: "git://github.com/batate/blacksmith.git"},
      {:shouldi, env: :test}
    ]
  end
  defp deps(:dev) do
    deps(:test) ++ [
      {:excoveralls, "~> 0.3"}
    ]
  end
  defp deps(_) do
    deps(:prod)
  end
end

defmodule HomebridgeWebhook.MixProject do
  use Mix.Project

  @version "0.1.4"

  def project do
    [
      app: :homebridge_webhook,
      version: @version,
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Dev and test
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.1", only: [:dev, :test], runtime: false},
      # Everything else
      {:hackney, "~> 1.18.0"},
      {:jason, "~> 1.0"},
      {:tesla, "~> 1.4.0"}
    ]
  end
end

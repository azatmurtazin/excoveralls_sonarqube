defmodule ExcoverallsSonarqube.MixProject do
  use Mix.Project

  def project do
    [
      app: :excoveralls_sonarqube,
      version: "0.1.3",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
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
      {:jason, "~> 1.1"},
      {:xml_builder, "~> 2.1"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp package do
    [
      description: "This package helps to convert Excoveralls JSON to the SonarQube XML report.",
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/azatmurtazin/excoveralls_sonarqube"}
    ]
  end
end

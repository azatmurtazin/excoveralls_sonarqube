# ExcoverallsSonarqube

This package helps to convert Excoveralls JSON to the SonarQube XML report.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `excoveralls_sonarqube` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:excoveralls_sonarqube, "~> 0.1.0"}
  ]
end
```

## Usage

```sh
mix sonarqube /tmp/excoveralls.json /tmp/sonarqube.xml
```

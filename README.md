# ExcoverallsSonarqube

This package helps to convert Excoveralls JSON to the SonarQube XML report.

## Installation

[Hex.pm](https://hex.pm/packages/excoveralls_sonarqube).

The package can be installed by adding `excoveralls_sonarqube` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:excoveralls_sonarqube, "~> 0.1"}
  ]
end
```

## Usage

```sh
mix deps.get
mix compile
mix coveralls.json

## and finally convert
mix sonarqube --input cover/excoveralls.json --output cover/sonarqube.xml
```

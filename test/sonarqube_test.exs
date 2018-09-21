defmodule SonarqubeTest do
  use ExUnit.Case

  alias Mix.Tasks.Sonarqube

  @expect_xml "test/fixtures/sonarqube.xml"
  @input_file "test/fixtures/excoveralls.json"
  @output_file "/tmp/coverage/sonarqube.xml"

  test "run" do
    Sonarqube.run([@input_file, @output_file])
    result = File.read!(@output_file) |> String.trim()
    expect = File.read!(@expect_xml) |> String.trim()

    assert expect == result
  end
end

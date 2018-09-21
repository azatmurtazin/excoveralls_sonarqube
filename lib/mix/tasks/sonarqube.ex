defmodule Mix.Tasks.Sonarqube do
  @moduledoc """
  Converts Excoveralls JSON to the SonarQube XML.
  """

  @shortdoc "Convert Excoveralls JSON to the SonarQube XML"

  use Mix.Task

  def run([input_file, output_file]) do
    IO.puts("Convert '#{input_file}' to '#{output_file}'")

    xml =
      input_file
      |> File.read!()
      |> Jason.decode!(keys: :atoms)
      |> to_xml()

    output_file
    |> create_dir()
    |> File.write!(xml)
  end

  def run(_), do: IO.puts("Provide input_file & output_file")

  def create_dir(output_file) do
    output_file
    |> Path.dirname()
    |> File.mkdir_p()

    output_file
  end

  def to_xml(json) do
    stats = json.source_files

    files =
      Enum.map(stats, fn s ->
        lines =
          s.coverage
          |> Enum.with_index(1)
          |> Enum.map(fn
            {nil, _ln} -> nil
            {0, ln} -> {:lineToCover, %{lineNumber: ln, covered: false}, []}
            {_hits, ln} -> {:lineToCover, %{lineNumber: ln, covered: true}, []}
          end)
          |> Enum.filter(& &1)

        {:file, %{path: s.name}, lines}
      end)

    {:coverage, %{version: "1"}, files} |> XmlBuilder.generate()
  end
end

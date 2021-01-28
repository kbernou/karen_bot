defmodule Karen.Consumer.Command.Graph do
  alias Nostrum.Api
  # TODO these dirs could be handled better for sure...
  def handle(msg) do
    # Should probably check that the graph code is in quotes, and if not return
    # an error.
    # Get text for graph
    # Save text to file?
    # Call `dot` cli to produce pic
    # Send pic to channel
    # Should probably remove created files afterwards

    # get text for graph

    clean_code(msg.content)
    |> create_graph_file(msg.id)
    |> create_graph_image(msg.id)

    Api.create_message(msg.channel_id, file: "./graphs/out/#{msg.id}.png")
  end

  defp create_graph_file(content, name) do
    path = "./graphs/in/#{name}.gv"
    File.write(path, String.trim(content, "\""))
    path
  end

  defp create_graph_image(in_file, out_name) do
    path = "./graphs/out/#{out_name}.png"
    System.cmd("dot", ["-Tpng", in_file, "-o", path])
    path
  end

  defp clean_code(text) do
    # Should be possible to use capture groups to have the regex strip leading
    # and trailing quotes but I don't feel like figuring that out just now

    processed_text = text
    |> String.replace("\n", " ")
    |> String.split("karen graph ")
    |> List.last

    Regex.run(~r/\".*\"/, processed_text) |> Enum.at(0) |> String.trim("\"")
  end
end

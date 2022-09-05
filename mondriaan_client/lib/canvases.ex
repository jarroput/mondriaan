defmodule MondriaanClient.Canvases do
  import Mondriaan
  alias MondriaanClient.Painter

  def list(client) do
    canvases = get("/api/canvases", client)

    Enum.map(canvases, & &1.id)
  end

  def show(client, id) do
    get("api/canvases/#{id}", client)
  end

  def draw(client, id) do
    canvas = show(client, id)

    Painter.paint(canvas.shapes)
    |> IO.puts()
  end
end

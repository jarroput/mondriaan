defmodule MondriaanClient.Canvases do
  @moduledoc """
  Provides a list of API methods that will call the server holding the canvases.
  """

  import Mondriaan
  alias MondriaanClient.Painter

  @doc """
  Lists the IDs of the available canvases.
  """
  def list(client) do
    canvases = get("/api/canvases", client)

    Enum.map(canvases, & &1.id)
  end

  @doc """
  Shows the canvas along with its individual shapes.
  """
  def show(client, id) do
    get("api/canvases/#{id}", client)
  end

  @doc """
  Fetches the canvas from the server, draws it, and writes the output to stdio.
  """
  def draw(client, id) do
    canvas = show(client, id)

    Painter.paint(canvas.shapes)
    |> IO.puts()
  end
end

defmodule MondriaanWeb.Api.CanvasController do
  use MondriaanWeb, :controller

  action_fallback(MondriaanWeb.Api.FallbackController)

  alias Mondriaan.Drawings.Canvases

  def list(conn, _) do
    canvases = Canvases.list()
    render(conn, "list.json", canvases: canvases)
  end

  def show(conn, %{"id" => id}) do
    with {:ok, canvas} <- Canvases.get(id) do
      render(conn, "show.json", canvas: canvas)
    end
  end
end

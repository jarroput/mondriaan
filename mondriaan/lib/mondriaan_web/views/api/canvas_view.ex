defmodule MondriaanWeb.Api.CanvasView do
  use MondriaanWeb, :view

  alias MondriaanWeb.Api.{CanvasView, ShapeView}

  def render("list.json", %{canvases: canvases}) do
    render_many(canvases, CanvasView, "show.json")
  end

  def render("show.json", %{canvas: canvas}) do
    render_one(canvas, CanvasView, "canvas.json")
  end

  def render("canvas.json", %{canvas: canvas}) do
    %{
      id: canvas.id,
      shapes: render_many(canvas.shapes, ShapeView, "show.json")
    }
  end
end

defmodule MondriaanWeb.Api.ShapeView do
  use MondriaanWeb, :view

  alias MondriaanWeb.Api.ShapeView

  def render("list.json", %{shapes: shapes}) do
    render_many(shapes, ShapeView, "show.json")
  end

  def render("show.json", %{shape: shape}) do
    render_one(shape, ShapeView, "shape.json")
  end

  def render("shape.json", %{shape: shape}) do
    %{
      x: shape.x,
      y: shape.y,
      width: shape.width,
      height: shape.height,
      outline: shape.outline,
      fill: shape.fill
    }
  end
end

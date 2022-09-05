defmodule Mondriaan.Drawings.CanvasesTest do
  use Mondriaan.DataCase, async: true

  alias Mondriaan.Drawings.Canvases

  describe "create/1" do
    test "stores canvas in database with shape" do
      shape = %{x: 2, y: 3, height: 10, width: 2, fill: "X", outline: "^"}
      canvas = %{shapes: [shape]}

      {:ok, canvas} = Canvases.create(canvas)

      stored_shape = hd(canvas.shapes)

      refute is_nil(canvas.id)

      assert stored_shape.x == shape.x
      assert stored_shape.y == shape.y
      assert stored_shape.height == shape.height
      assert stored_shape.width == shape.width
      assert stored_shape.fill == shape.fill
      assert stored_shape.outline == shape.outline
    end

    test "stores canvas in database with multiple shapes" do
      shape = %{x: 2, y: 3, height: 10, width: 2, fill: "X", outline: "^"}
      canvas = %{shapes: [shape, shape, shape]}

      {:ok, canvas} = Canvases.create(canvas)

      refute is_nil(canvas.id)

      for stored_shape <- canvas.shapes do
        assert stored_shape.x == shape.x
        assert stored_shape.y == shape.y
        assert stored_shape.height == shape.height
        assert stored_shape.width == shape.width
        assert stored_shape.fill == shape.fill
        assert stored_shape.outline == shape.outline
      end
    end
  end

  describe "get/1" do
    test "returns nil for unknown id" do
      assert {:error, :not_found} == Canvases.get(Ecto.UUID.generate())
    end

    test "returns canvas by uuid" do
      shape = %{x: 2, y: 3, height: 10, width: 2, fill: "X", outline: "^"}
      new_canvas = %{shapes: [shape]}

      {:ok, %{id: id}} = Canvases.create(new_canvas)

      {:ok, canvas} = Canvases.get(id)

      refute is_nil(canvas)
      assert length(canvas.shapes) == 1
    end
  end

  describe "list/0" do
    test "returns empty list if no canvases present" do
      assert [] == Canvases.list()
    end

    test "returns list of canvases present in database" do
      for i <- 1..3 do
        shape = %{x: i, y: i, height: i, width: i, fill: "X", outline: "^"}
        new_canvas = %{shapes: [shape]}

        {:ok, _canvas} = Canvases.create(new_canvas)
      end

      canvases = Canvases.list()

      for canvas <- canvases do
        refute is_nil(canvas.id)
      end
    end
  end
end

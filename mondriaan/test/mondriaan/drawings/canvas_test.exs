defmodule Mondriaan.Drawings.CanvasTest do
  use Mondriaan.DataCase, async: true

  alias Mondriaan.Drawings.Canvas

  describe "changeset/1" do
    test "refutes empty shapes" do
      canvas = %{shapes: []}

      changeset = Canvas.changeset(%Canvas{}, canvas)

      assert errors_on(changeset)[:shapes] == ["can't be blank"]
    end

    test "validates shapes with missing properties" do
      shape = %{x: 2, y: 3, fill: "X", outline: "^"}
      canvas = %{shapes: [shape]}

      changeset = Canvas.changeset(%Canvas{}, canvas)

      assert errors_on(changeset)[:shapes] == [
               %{
                 height: ["can't be blank"],
                 width: ["can't be blank"]
               }
             ]
    end
  end
end

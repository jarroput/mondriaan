defmodule MondriaanWeb.Api.CanvasControllerTest do
  use MondriaanWeb.ConnCase, async: true

  describe "get" do
    test "renders 404 for non existing id", %{conn: conn} do
      uuid = Ecto.UUID.generate()

      conn =
        conn
        |> get(Routes.canvas_path(conn, :show, uuid))

      %{"errors" => error} = json_response(conn, 404)

      assert error["detail"] == "Not Found"
    end

    test "returns canvas in json format", %{conn: conn} do
      canvas = Fixture.create_canvas()

      conn =
        conn
        |> get(Routes.canvas_path(conn, :show, canvas.id))

      response = json_response(conn, 200)

      assert response["id"] == canvas.id
      assert length(response["shapes"]) == 4
    end
  end

  describe "list" do
    test "renders empty list when no canvases present", %{conn: conn} do
      conn =
        conn
        |> get(Routes.canvas_path(conn, :list))

      response = json_response(conn, 200)

      assert response == []
    end

    test "returns all canvases from database", %{conn: conn} do
      canvases = [Fixture.create_canvas(), Fixture.create_canvas()]

      conn =
        conn
        |> get(Routes.canvas_path(conn, :list))

      response = json_response(conn, 200)

      assert length(response) == length(canvases)

      for canvas <- response do
        assert Enum.any?(canvases, &(&1.id == canvas["id"]))
      end
    end
  end
end

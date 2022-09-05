defmodule MondriaanWeb.Router do
  use MondriaanWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", MondriaanWeb.Api do
    pipe_through(:api)

    get("/canvases", CanvasController, :list)
    get("/canvases/:id", CanvasController, :show)
  end
end

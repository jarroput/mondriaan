defmodule MondriaanWeb.Router do
  use MondriaanWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MondriaanWeb do
    pipe_through :api
  end
end

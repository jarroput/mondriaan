defmodule Fixture do
  alias Mondriaan.Repo
  alias Mondriaan.Drawings.Canvas

  def create_canvas() do
    Repo.insert!(%Canvas{
      shapes: [
        %{x: 3, y: 2, width: 5, height: 3, outline: "@", fill: "X"},
        %{x: 10, y: 3, width: 14, height: 6, outline: "X", fill: "O"},
        %{x: 14, y: 0, width: 7, height: 6, outline: nil, fill: "."},
        %{x: 0, y: 3, width: 8, height: 4, outline: "O", fill: nil}
      ]
    })
  end
end

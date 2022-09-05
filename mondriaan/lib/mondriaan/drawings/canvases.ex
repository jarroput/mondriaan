defmodule Mondriaan.Drawings.Canvases do
  @moduledoc """
  Context module to create and fetch canvases from the database.
  """

  alias Mondriaan.Drawings.Canvas
  alias Mondriaan.Repo

  @doc """
  Lists *all* stored canvases. There is no filter on this function
  """
  def list() do
    Repo.all(Canvas)
  end

  def get(id) do
    case Repo.get(Canvas, id) do
      %Canvas{} = canvas ->
        {:ok, canvas}

      _ ->
        {:error, :not_found}
    end
  end

  @doc ~S"""
  Stores a new canvas with the provided shapes in the database.
  """
  def create(canvas) do
    %Canvas{}
    |> Canvas.changeset(canvas)
    |> Repo.insert()
  end
end

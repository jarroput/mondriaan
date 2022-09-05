defmodule Mondriaan.Drawings.Canvas do
  use Ecto.Schema
  import Ecto.Changeset

  alias Mondriaan.Drawings.Shape

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "canvases" do
    embeds_many(:shapes, Shape, on_replace: :delete)

    timestamps()
  end

  @doc false
  def changeset(canvas, attrs) do
    canvas
    |> cast(attrs, [])
    |> cast_embed(:shapes, required: true)
  end
end

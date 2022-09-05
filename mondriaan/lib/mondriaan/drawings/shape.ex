defmodule Mondriaan.Drawings.Shape do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field(:x, :integer)
    field(:y, :integer)
    field(:height, :integer)
    field(:width, :integer)
    field(:outline, :string)
    field(:fill, :string)
  end

  def changeset(schema, params) do
    schema
    |> cast(params, [:x, :y, :height, :width, :outline, :fill])
    |> validate_required([:x, :y, :height, :width])
  end
end

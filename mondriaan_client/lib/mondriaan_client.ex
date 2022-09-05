defmodule MondriaanClient do
  @max_rows 10
  @max_cols 25

  @moduledoc """
  Documentation for `MondriaanClient`.
  """

  @doc """
  Draws shapes onto an empty canvas.
  """
  def paint(shapes) do
    create_empty_canvas({@max_rows, @max_cols})
    |> draw(shapes)
    |> convert_to_print()
  end

  @doc """
  Converts the canvas into a printable format.

  ## Examples

      iex> MondriaanClient.convert_to_print(%{
      ...> 0 => %{0 => "x", 1 => "x", 2 => "x"},
      ...> 1 => %{0 => "x", 1 => ".", 2 => "x"},
      ...> 2 => %{0 => "x", 1 => "x", 2 => "x"},
      ...> })
      "xxx\\nx.x\\nxxx"

  """
  def convert_to_print(canvas) do
    canvas
    |> Enum.map_join("\n", fn {_col, row} ->
      row
      |> Enum.map_join(fn {_y, char} -> char end)
      |> String.trim_trailing()
    end)
  end

  def draw(canvas, shapes) do
    Enum.reduce(shapes, canvas, fn shape, canvas ->
      draw_shape(canvas, shape)
    end)
  end

  @doc """
  Draws the given shape onto the canvas.
  Any previously painted shape will be overwritten by this operation.

  ## Examples

      iex> canvas = %{
      ...> 0 => %{0 => "!", 1 => "!", 2 => "!"},
      ...> 1 => %{0 => "!", 1 => "!", 2 => "!"},
      ...> 2 => %{0 => "!", 1 => "!", 2 => "!"}
      ...> }
      ...> shape = %{x: 1, y: 1, height: 2, width: 2, fill: "0"}
      ...> MondriaanClient.draw_shape(canvas, shape)
      %{
       0 => %{0 => "!", 1 => "!", 2 => "!"},
       1 => %{0 => "!", 1 => "0", 2 => "0"},
       2 => %{0 => "!", 1 => "0", 2 => "0"}
       }
  """

  def draw_shape(canvas, shape) do
    x_end = shape.x + shape.width - 1
    y_end = shape.y + shape.height - 1

    outline = shape[:outline] || shape[:fill]
    fill = shape[:fill] || " "

    shape.x..x_end
    |> Enum.reduce(canvas, fn x, canvas ->
      shape.y..y_end
      |> Enum.reduce(canvas, fn y, canvas ->
        char = if outline?({x, y}, {shape.x, x_end, shape.y, y_end}), do: outline, else: fill
        put_in(canvas, [y, x], char)
      end)
    end)
  end

  @doc """
  Determines whether or not a coordinate lies on one of the edges of a square.

  The examples use a 4 by 4 square starting on coordinates X: 1, Y: 1

  ## Examples

      iex> MondriaanClient.outline?({1, 1}, {1, 4, 1, 4})
      true

      iex> MondriaanClient.outline?({2, 1}, {1, 4, 1, 4})
      true

      iex> MondriaanClient.outline?({4, 4}, {1, 4, 1, 4})
      true

      iex> MondriaanClient.outline?({2, 2}, {1, 4, 1, 4})
      false

      iex> MondriaanClient.outline?({99, 99}, {1, 4, 1, 4})
      false
  """
  def outline?({row, col}, {x_start, x_end, y_start, y_end}) do
    cond do
      row >= x_start and (col == y_start or col == y_end) ->
        true

      col >= y_start and (row == x_start or row == x_end) ->
        true

      true ->
        false
    end
  end

  @doc """
  Creates an empty canvas to draw the shapes onto.

  ## Examples

      iex> MondriaanClient.create_empty_canvas({2,2})
      %{
        0 => %{0 => " ", 1 => " "},
        1 => %{0 => " ", 1 => " "},
      }

      iex> MondriaanClient.create_empty_canvas({1,3})
      %{
        0 => %{0 => " ", 1 => " ", 2 => " "}
      }
  """

  def create_empty_canvas({rows, cols}) do
    0..abs(rows - 1)
    |> Enum.map(fn x ->
      cols =
        0..abs(cols - 1)
        |> Enum.map(fn y -> {y, " "} end)
        |> Enum.into(%{})

      {x, cols}
    end)
    |> Enum.into(%{})
  end
end

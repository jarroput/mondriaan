defmodule MondriaanClient do
  defstruct endpoint: "http://localhost:4000/"

  @moduledoc """
  """

  def new, do: %__MODULE__{}

  def new(endpoint) do
    endpoint =
      if String.ends_with?(endpoint, "/") do
        endpoint
      else
        endpoint <> "/"
      end

    %__MODULE__{endpoint: endpoint}
  end
end

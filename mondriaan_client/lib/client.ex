defmodule MondriaanClient do
  defstruct endpoint: "http://localhost:4000/"

  @moduledoc """
  The client holds the endpoint to where we send requests.
  """

  @doc """
  Builds a new client pointing to the default endpoint https://localhost:4000/
  """
  def new, do: %__MODULE__{}

  @doc """
  Builds a new client pointing to the provided endpoint.
  """
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

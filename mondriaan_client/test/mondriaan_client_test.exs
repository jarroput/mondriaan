defmodule MondriaanClientTest do
  use ExUnit.Case
  doctest MondriaanClient

  test "greets the world" do
    assert MondriaanClient.hello() == :world
  end
end

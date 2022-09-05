defmodule Fixture do
  @fixture_path "./test/fixtures/"

  def load_fixture(path_to_fixture) do
    File.read!(@fixture_path <> path_to_fixture)
  end
end

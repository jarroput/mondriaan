defmodule MondriaanClientTest do
  use ExUnit.Case
  doctest MondriaanClient

  describe "test_fixtures" do
    # Rectangle at [3,2] with width: 5, height: 3, outline character: @, fill character: X
    # Rectangle at [10, 3] with width: 14, height: 6, outline character: X, fill character: O
    test "fixture 1" do
      shapes = [
        %{x: 3, y: 2, width: 5, height: 3, outline: "@", fill: "X"},
        %{x: 10, y: 3, width: 14, height: 6, outline: "X", fill: "O"}
      ]

      painting = MondriaanClient.paint(shapes)

      fixture = Fixture.load_fixture("fixture_1")

      assert fixture == painting
    end

    # Rectangle at [14, 0] with width 7, height 6, outline character: none, fill: .
    # Rectangle at [0, 3] with width 8, height 4, outline character: O, fill: none
    # Rectangle at [5, 5] with width 5, height 3, outline character: X, fill: X
    test "fixture 2" do
      shapes = [
        %{x: 14, y: 0, width: 7, height: 6, outline: nil, fill: "."},
        %{x: 0, y: 3, width: 8, height: 4, outline: "O", fill: nil},
        %{x: 5, y: 5, width: 5, height: 3, outline: "X", fill: "X"}
      ]

      painting = MondriaanClient.paint(shapes)

      fixture = Fixture.load_fixture("fixture_2")

      assert fixture == painting
    end
  end
end

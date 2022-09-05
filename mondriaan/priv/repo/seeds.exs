# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Mondriaan.Repo.insert!(%Mondriaan.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Mondriaan.Repo
alias Mondriaan.Drawings.Canvas

Repo.insert!(%Canvas{
  shapes: [
    %{x: 3, y: 2, width: 5, height: 3, outline: "@", fill: "X"},
    %{x: 10, y: 3, width: 14, height: 6, outline: "X", fill: "O"}
  ]
})

Repo.insert!(%Canvas{
  shapes: [
    %{x: 14, y: 0, width: 7, height: 6, outline: nil, fill: "."},
    %{x: 0, y: 3, width: 8, height: 4, outline: "O", fill: nil},
    %{x: 5, y: 5, width: 5, height: 3, outline: "X", fill: "X"}
  ]
})

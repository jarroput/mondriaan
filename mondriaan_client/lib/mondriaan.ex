defmodule Mondriaan do
  def get(path, client) do
    req = Req.new(base_url: client.endpoint)

    Req.get!(req, url: path, decode_body: false).body
    |> Jason.decode!(keys: :atoms)
  end
end

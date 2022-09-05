# Mondriaan Client & Server

This repo consists of two applications, combined into a client-server system to
represent an ASCII art drawing canvas.

Canvases are stored in the server. The client application can be used to look up
these canvases and display them.

PostgreSQL is required for storage of the canvases.
The PostgreSQL wiki has [installation guides](https://wiki.postgresql.org/wiki/Detailed_installation_guides) for a number of different systems.

### To start the server:

  * Go to server directory with `cd mondriaan`
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`.

    This also seeds the database with two preconfigured canvases.
  * Start the server `mix phx.server` or inside IEx with `iex -S mix phx.server`
  * Keep the server running while going to the next step

### To show the canvases

  * Open another terminal window and go to the mondriaan_client directory `cd mondriaan_client`.
  * Install dependencies with `mix deps.get`
  * Startup the client with `iex -S mix`
  * Initialize a new client, fetch canvas IDs and print one of the canvases
  ```
  client = MondriaanClient.new()
  canvas_ids = MondriaanClient.Canvases.list(client)
  MondriaanClient.Canvases.draw(client, hd(canvas_ids))
  ```

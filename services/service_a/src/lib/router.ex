defmodule Router do
  use Plug.Router

  plug :match
  plug :dispatch

  match _ do
    send_resp(conn, 200, "Here is service A from port #{Utils.port()}")
  end
end

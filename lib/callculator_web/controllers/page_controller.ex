defmodule CallculatorWeb.PageController do
  use CallculatorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

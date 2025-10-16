defmodule BibleWeb.PageController do
  use BibleWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end

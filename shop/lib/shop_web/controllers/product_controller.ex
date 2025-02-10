defmodule ShopWeb.ProductController do
  use ShopWeb, :controller

  def index(conn, _params) do
    render(conn, :index, layout: false)
  end

  def show(conn, %{"id" => id}) do
    render(conn, :show, layout: false, id: id)
  end
end

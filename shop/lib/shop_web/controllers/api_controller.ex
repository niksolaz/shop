defmodule ShopWeb.ApiController do
  use ShopWeb, :controller

  alias Shop.Blogs

  def index(conn, _params) do
    blogs = Blogs.list_blogs()
    conn
    |> assign(:blogs, blogs)
    |> render(:index)
  end
end

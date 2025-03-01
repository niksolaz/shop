defmodule ShopWeb.BlogController do
  use ShopWeb, :controller

  alias Shop.Blogs
  alias Shop.Blog

  def index(conn, _params) do
    render(conn, :index, layout: false, blogs: Blogs.list_blogs())
  end

  def show(conn, %{"id" => id}) do
    render(conn, :show, layout: false, blog: Blogs.get_blog!(id))
  end

  def new(conn, _params) do
    changeset = Blogs.change_blog(%Blog{})
    render(conn, :new, form: Phoenix.Component.to_form(changeset))
  end

  def create(conn, %{"blog" => blog_params}) do
    case Blogs.create_blog(blog_params) do
      {:ok, blog} ->
        conn
        |> put_flash(:info, "Blog creato con successo!")
        |> redirect(to: ~p"/blogs/#{blog.id}")

      {:error, changeset} ->
        render(conn, :new, form: Phoenix.Component.to_form(changeset))
    end
  end
end

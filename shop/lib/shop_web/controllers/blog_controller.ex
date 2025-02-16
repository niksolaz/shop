defmodule ShopWeb.BlogController do
  use ShopWeb, :controller

  defp blogs do
    [
      %{id: 1, title: "My Blog Post 1", description: "Lorem ipsum dolor sit amet.", img: "https://placehold.co/600x400/C80000/FFFFFF.png", date_creation: ~U[2024-01-01T10:00:00Z]},
      %{id: 2, title: "My Blog Post 2", description: "Lorem ipsum dolor sit amet", img: "https://placehold.co/600x400/FFFFFF/000000.png", date_creation: ~U[2024-01-02T13:20:00Z]},
      %{id: 3, title: "My Blog Post 3", description: "Lorem ipsum dolor sit amet", img: "https://placehold.co/600x400/008000/FFFFFF.png", date_creation: ~U[2024-01-03T09:30:00Z]},
      %{id: 4, title: "My Blog Post 4", description: "Lorem ipsum dolor sit amet", img: "https://placehold.co/600x400/C808C0/FFFFFF.png", date_creation: ~U[2024-01-01T10:00:00Z]},
      %{id: 5, title: "My Blog Post 5", description: "Lorem ipsum dolor sit amet", img: "https://placehold.co/600x400/FFA500/FFFFFF.png", date_creation: ~U[2024-01-02T13:20:00Z]},
      %{id: 6, title: "My Blog Post 6", description: "Lorem ipsum dolor sit amet", img: "https://placehold.co/600x400/0000FF/FFFFFF.png", date_creation: ~U[2024-01-03T09:30:00Z]}
    ]
  end

  defp get_blog(id) do
    Enum.find(blogs(), fn blog -> blog.id == String.to_integer(id) end)
  end

  def index(conn, _params) do
    render(conn, :index, layout: false, blogs: blogs())
  end

  def show(conn, %{"id" => id}) do
    render(conn, :show, layout: false, blog: get_blog(id))
  end
end

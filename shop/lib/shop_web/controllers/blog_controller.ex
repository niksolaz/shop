defmodule ShopWeb.BlogController do
  use ShopWeb, :controller

  defp blogs do
    [
      %{id: 1, title: "My Blog Post 1", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", img: "https://placehold.co/600x400/C80000/FFFFFF.png", date_creation: "2024-01-01T10:00:00Z"},
      %{id: 2, title: "My Blog Post 2", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", img: "https://placehold.co/600x400/FFFFFF/000000.png", date_creation: "2024-01-02T13:20:00Z"},
      %{id: 3, title: "My Blog Post 3", description: "Lorem ipsum dolor sit amet ipsum arcu nascetur laoreet luctus per consectetur class eleifend viverra proin tincidunt rhoncus maecenas tellus cras mus justo enim felis lectus fermentum pharetra molestie mi vitae quis torquent magnis mattis nec libero dapibus elementum massa nisl ut conubia erat semper lorem parturient et tempor eu nullam tristique scelerisque donec nostra vel eros condimentum dolor magna blandit pellentesque curae sapien commodo primis ornare imperdiet egestas nulla sociosqu facilisis penatibus aptent fringilla lacus ridiculus ultricies ex eget vulputate auctor fusce pede ad suspendisse nisi purus rutrum a mollis sagittis dui diam quisque habitant etiam faucibus dis", img: "https://placehold.co/600x400/008000/FFFFFF.png", date_creation: "2024-01-03T09:30:00Z"},
      %{id: 1, title: "My Blog Post 1", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", img: "https://placehold.co/600x400/C80000/FFFFFF.png", date_creation: "2024-01-01T10:00:00Z"},
      %{id: 2, title: "My Blog Post 2", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", img: "https://placehold.co/600x400/FFFFFF/000000.png", date_creation: "2024-01-02T13:20:00Z"},
      %{id: 3, title: "My Blog Post 3", description: "Lorem ipsum dolor sit amet ipsum arcu nascetur laoreet luctus per consectetur class eleifend viverra proin tincidunt rhoncus maecenas tellus cras mus justo enim felis lectus fermentum pharetra molestie mi vitae quis torquent magnis mattis nec libero dapibus elementum massa nisl ut conubia erat semper lorem parturient et tempor eu nullam tristique scelerisque donec nostra vel eros condimentum dolor magna blandit pellentesque curae sapien commodo primis ornare imperdiet egestas nulla sociosqu facilisis penatibus aptent fringilla lacus ridiculus ultricies ex eget vulputate auctor fusce pede ad suspendisse nisi purus rutrum a mollis sagittis dui diam quisque habitant etiam faucibus dis", img: "https://placehold.co/600x400/008000/FFFFFF.png", date_creation: "2024-01-03T09:30:00Z"}
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

defmodule ShopWeb.BlogController do
  use ShopWeb, :controller

  defp blogs do
    [
      %{id: 1, title: "My Blog Post 1", description: "Lorem ipsum dolor sit amet.", img: "https://imgs.search.brave.com/9V39Be3HGqJWwhgr9EJrrUtH5F1fHtFxecBEq4vMYq4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzA5LzE0LzI5LzYz/LzM2MF9GXzkxNDI5/NjMyMV9pYmNmazkw/alZEQkpEN2xUa0Vj/TkhHbjREdE1HY0NJ/NC5qcGc", date_creation: ~U[2024-01-01T10:00:00Z]},
      %{id: 2, title: "My Blog Post 2", description: "Lorem ipsum dolor sit amet", img: "https://imgs.search.brave.com/EQPz6di5Aluu5-TkRMAPKUAb-rfAo6PWeNNlSbzbDr8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTM2/NzMzNzYzMy9waG90/by9tZXRhdmVyc2Ut/Y29uY2VwdC1jb21w/b3NpdGUtaW1hZ2Uu/anBnP3M9NjEyeDYx/MiZ3PTAmaz0yMCZj/PU5sVU4yMUpoR2dJ/bjJvLWNlb3R0N3pT/aThDaE5rUW5tM2RH/azJjRldwa1E9", date_creation: ~U[2024-01-02T13:20:00Z]},
      %{id: 3, title: "My Blog Post 3", description: "Lorem ipsum dolor sit amet", img: "https://imgs.search.brave.com/xMGjkIh5RZD5AcZn1YWANSI8zGsMp91hterunOsub9I/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzA0Lzc0LzE3LzAx/LzM2MF9GXzQ3NDE3/MDE4NV9Lb2djanZI/em1vRlIzT2IxdDNF/NktyZjRsdTlNNXJx/YS5qcGc", date_creation: ~U[2024-01-03T09:30:00Z]},
      %{id: 4, title: "My Blog Post 4", description: "Lorem ipsum dolor sit amet", img: "https://imgs.search.brave.com/AMhs3B9IP-D-FQJZ8kJlB58-LWKtwU9woYOfDDSCh3I/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzA3LzY3LzQ1LzEy/LzM2MF9GXzc2NzQ1/MTIzNV91eVBicVZC/SGFhNUZNaWo0SnE0/eGw2eW90dVdyUm56/cy5qcGc", date_creation: ~U[2024-01-01T10:00:00Z]},
      %{id: 5, title: "My Blog Post 5", description: "Lorem ipsum dolor sit amet", img: "https://imgs.search.brave.com/RSLvQIrvTr1ki3U5hWHKc3p1tVhTad8qa4dXtwNQCaQ/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzA2LzAzLzM5Lzk0/LzM2MF9GXzYwMzM5/OTQzNl9uVnB0cHFT/Rkg4Qm51QUlmTDZi/OXJobjdZMUpEVVcz/Qy5qcGc", date_creation: ~U[2024-01-02T13:20:00Z]},
      %{id: 6, title: "My Blog Post 6", description: "Lorem ipsum dolor sit amet", img: "https://imgs.search.brave.com/rEd9s3-6uQAmn-hzZZiovvbC6RVddBUO6CyRdKHdSNY/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzEwLzgxLzAyLzg2/LzM2MF9GXzEwODEw/Mjg2MjdfNzlsblBs/QlVPUk9FWlNJcXY4/NEVuQ2sxa1lSaEFM/YVMuanBn", date_creation: ~U[2024-01-03T09:30:00Z]}
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

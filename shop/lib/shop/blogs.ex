defmodule Shop.Blogs do
  alias Shop.Repo
  alias Shop.Blog

  def list_blogs do
    Repo.all(Blog)
  end

  def get_blog!(id) do
    Repo.get!(Blog, id)
  end

  def change_blog(%Blog{} = blog) do
    Shop.Blog.changeset(blog, %{})
  end

  def create_blog(attrs) do
    %Blog{}
    |> Blog.changeset(attrs)
    |> Repo.insert()
  end
end

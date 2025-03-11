defmodule Shop.Products do
  alias Shop.Repo
  alias Shop.Product

  def list_products do
    Repo.all(Product)
  end
end

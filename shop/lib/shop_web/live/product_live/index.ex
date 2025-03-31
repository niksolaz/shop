defmodule ShopWeb.ProductLive.Index do
  use ShopWeb, :live_view

  alias Shop.Products

  def mount(_params, _session, socket) do
    products = Products.list_products()
    socket = socket |> assign(:products, products)
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1>This is page of Product Live</h1>
      <ul>
        <li :for={product <- @products}>
          <p><%= product.name %></p>
        </li>
      </ul>
    </div>
    """
  end
end

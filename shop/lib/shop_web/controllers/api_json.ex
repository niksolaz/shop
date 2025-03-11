defmodule ShopWeb.ApiJSON do
  def index(%{blogs: blogs}) do
    %{blogs: blogs}
  end
end

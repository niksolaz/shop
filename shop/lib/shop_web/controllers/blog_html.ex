defmodule ShopWeb.BlogHTML do
  use ShopWeb, :html

  embed_templates "blog_html/*"

  def blog_id(assigns) do
    ~H"""
    <div class="flex justify-start w-full border-b border-gray-200 shadow-md rounded-l-lg">
      <.back navigate={~p"/blogs"}>Back to Blogs</.back>
      <div class="text-2xl font-bold mx-10">
        <h1>Happy reading for this blog {assigns.title}</h1>
      </div>
    </div>
    """
  end
end

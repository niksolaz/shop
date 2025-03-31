defmodule ShopWeb.JobLive.Index do
  use ShopWeb, :live_view

  alias Shop.Jobs

  def mount(_params, _session, socket) do
    jobs = Jobs.list_jobs()
    likes = jobs
    |> Enum.map(fn job -> {job.id, 0} end)
    |> Map.new()

    socket = socket
    |> assign(:jobs, jobs)
    |> assign(:likes, likes)

    {:ok, socket}
  end

  def handle_event("like", %{"id" => id}, socket) do
    id = String.to_integer(id)

    likes = Map.put(socket.assigns.likes, id, socket.assigns.likes[id] + 1)

    socket = socket
    |> assign(:likes, likes)

    {:noreply, socket}
  end

  def handle_event("dislike", %{"id" => id}, socket) do
    id = String.to_integer(id)
    likes = Map.put(socket.assigns.likes, id, socket.assigns.likes[id] - 1)

    socket = socket
    |> assign(:likes, likes)

    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1>This is page of Job Live</h1>
      <ul class="space-y-2">
        <li :for={job <- @jobs} class="py-2 border border-gray-200 rounded-md p-2">
          <p class="flex items-center gap-2">
            <img src={job.logo} width="20" height="20" />
            <span>{job.name}</span>
            <span class="text-sm text-gray-500">- Likes: {@likes[job.id]}</span>
          </p>
          <div class="flex items-center gap-2 mt-2">
            <.icon name="hero-hand-thumb-up-mini" class="text-orange-500" phx-click="like" phx-value-id={job.id} />
            <.icon name="hero-hand-thumb-down-mini" class="text-orange-500" phx-click="dislike" phx-value-id={job.id} />
          </div>
        </li>
      </ul>
    </div>
    """
  end
end

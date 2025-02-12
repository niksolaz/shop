defmodule ShopWeb.Plugs.SetConsole do
  import Plug.Conn

  @valid_consoles ["nintendo", "ps5", "xbox", "pc"]

  def init(opts), do: opts

  def call(%Plug.Conn{:params => %{"console" => console}} = conn, _opts) when console in @valid_consoles do
    conn
    |> assign(:console, console)
    |> put_resp_cookie("console", console, max_age: :timer.hours(24) * 30)
  end

  def call(%Plug.Conn{:cookies => %{"console" => console}} = conn, _opts) when console in @valid_consoles do
    conn
    |> assign(:console, console)
  end

  def call(%Plug.Conn{} = conn, opts) do
    conn
    |> assign(:console, opts)
  end
end

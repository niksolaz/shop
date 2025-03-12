defmodule ShopWeb.MarketController do
  use ShopWeb, :controller

  alias Shop.Markets
  alias Shop.Markets.Market

  action_fallback ShopWeb.FallbackController

  def index(conn, _params) do
    markets = Markets.list_markets()
    render(conn, :index, markets: markets)
  end

  def create(conn, %{"market" => market_params}) do
    with {:ok, %Market{} = market} <- Markets.create_market(market_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/markets/#{market}")
      |> render(:show, market: market)
    end
  end

  def show(conn, %{"id" => id}) do
    market = Markets.get_market!(id)
    render(conn, :show, market: market)
  end

  def update(conn, %{"id" => id, "market" => market_params}) do
    market = Markets.get_market!(id)

    with {:ok, %Market{} = market} <- Markets.update_market(market, market_params) do
      render(conn, :show, market: market)
    end
  end

  def delete(conn, %{"id" => id}) do
    market = Markets.get_market!(id)

    with {:ok, %Market{}} <- Markets.delete_market(market) do
      send_resp(conn, :no_content, "")
    end
  end
end

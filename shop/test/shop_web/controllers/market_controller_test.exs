defmodule ShopWeb.MarketControllerTest do
  use ShopWeb.ConnCase

  import Shop.MarketsFixtures

  alias Shop.Markets.Market

  @create_attrs %{
    name: "some name",
    price: 42
  }
  @update_attrs %{
    name: "some updated name",
    price: 43
  }
  @invalid_attrs %{name: nil, price: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all markets", %{conn: conn} do
      conn = get(conn, ~p"/api/markets")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create market" do
    test "renders market when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/markets", market: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/markets/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some name",
               "price" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/markets", market: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update market" do
    setup [:create_market]

    test "renders market when data is valid", %{conn: conn, market: %Market{id: id} = market} do
      conn = put(conn, ~p"/api/markets/#{market}", market: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/markets/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some updated name",
               "price" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, market: market} do
      conn = put(conn, ~p"/api/markets/#{market}", market: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete market" do
    setup [:create_market]

    test "deletes chosen market", %{conn: conn, market: market} do
      conn = delete(conn, ~p"/api/markets/#{market}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/markets/#{market}")
      end
    end
  end

  defp create_market(_) do
    market = market_fixture()
    %{market: market}
  end
end

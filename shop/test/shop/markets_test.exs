defmodule Shop.MarketsTest do
  use Shop.DataCase

  alias Shop.Markets

  describe "markets" do
    alias Shop.Markets.Market

    import Shop.MarketsFixtures

    @invalid_attrs %{name: nil, price: nil}

    test "list_markets/0 returns all markets" do
      market = market_fixture()
      assert Markets.list_markets() == [market]
    end

    test "get_market!/1 returns the market with given id" do
      market = market_fixture()
      assert Markets.get_market!(market.id) == market
    end

    test "create_market/1 with valid data creates a market" do
      valid_attrs = %{name: "some name", price: 42}

      assert {:ok, %Market{} = market} = Markets.create_market(valid_attrs)
      assert market.name == "some name"
      assert market.price == 42
    end

    test "create_market/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Markets.create_market(@invalid_attrs)
    end

    test "update_market/2 with valid data updates the market" do
      market = market_fixture()
      update_attrs = %{name: "some updated name", price: 43}

      assert {:ok, %Market{} = market} = Markets.update_market(market, update_attrs)
      assert market.name == "some updated name"
      assert market.price == 43
    end

    test "update_market/2 with invalid data returns error changeset" do
      market = market_fixture()
      assert {:error, %Ecto.Changeset{}} = Markets.update_market(market, @invalid_attrs)
      assert market == Markets.get_market!(market.id)
    end

    test "delete_market/1 deletes the market" do
      market = market_fixture()
      assert {:ok, %Market{}} = Markets.delete_market(market)
      assert_raise Ecto.NoResultsError, fn -> Markets.get_market!(market.id) end
    end

    test "change_market/1 returns a market changeset" do
      market = market_fixture()
      assert %Ecto.Changeset{} = Markets.change_market(market)
    end
  end
end

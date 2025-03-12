defmodule Shop.MarketsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Shop.Markets` context.
  """

  @doc """
  Generate a market.
  """
  def market_fixture(attrs \\ %{}) do
    {:ok, market} =
      attrs
      |> Enum.into(%{
        name: "some name",
        price: 42
      })
      |> Shop.Markets.create_market()

    market
  end
end

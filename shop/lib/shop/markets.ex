defmodule Shop.Markets do
  @moduledoc """
  The Markets context.
  """

  import Ecto.Query, warn: false
  alias Shop.Repo

  alias Shop.Markets.Market

  @doc """
  Returns the list of markets.

  ## Examples

      iex> list_markets()
      [%Market{}, ...]

  """
  def list_markets do
    Repo.all(Market)
  end

  @doc """
  Gets a single market.

  Raises `Ecto.NoResultsError` if the Market does not exist.

  ## Examples

      iex> get_market!(123)
      %Market{}

      iex> get_market!(456)
      ** (Ecto.NoResultsError)

  """
  def get_market!(id), do: Repo.get!(Market, id)

  @doc """
  Creates a market.

  ## Examples

      iex> create_market(%{field: value})
      {:ok, %Market{}}

      iex> create_market(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_market(attrs \\ %{}) do
    %Market{}
    |> Market.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a market.

  ## Examples

      iex> update_market(market, %{field: new_value})
      {:ok, %Market{}}

      iex> update_market(market, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_market(%Market{} = market, attrs) do
    market
    |> Market.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a market.

  ## Examples

      iex> delete_market(market)
      {:ok, %Market{}}

      iex> delete_market(market)
      {:error, %Ecto.Changeset{}}

  """
  def delete_market(%Market{} = market) do
    Repo.delete(market)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking market changes.

  ## Examples

      iex> change_market(market)
      %Ecto.Changeset{data: %Market{}}

  """
  def change_market(%Market{} = market, attrs \\ %{}) do
    Market.changeset(market, attrs)
  end
end

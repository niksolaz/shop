defmodule Shop.Markets.Market do
  use Ecto.Schema
  import Ecto.Changeset

  schema "markets" do
    field :name, :string
    field :price, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(market, attrs) do
    market
    |> cast(attrs, [:name, :price])
    |> validate_required([:name, :price])
  end
end

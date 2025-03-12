defmodule Shop.Repo.Migrations.CreateMarkets do
  use Ecto.Migration

  def change do
    create table(:markets) do
      add :name, :string
      add :price, :integer

      timestamps(type: :utc_datetime)
    end
  end
end

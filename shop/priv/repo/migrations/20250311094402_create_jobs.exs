defmodule Shop.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :name, :string
      add :description, :string
      add :role, :string
      add :is_actual_present, :boolean, default: false, null: false
      add :logo, :string
      add :start_date, :utc_datetime
      add :end_date, :utc_datetime

      timestamps(type: :utc_datetime)
    end
  end
end

defmodule Shop.Jobs.Job do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jobs" do
    field :name, :string
    field :description, :string
    field :role, :string
    field :logo, :string
    field :is_actual_present, :boolean, default: false
    field :start_date, :utc_datetime
    field :end_date, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, [:name, :description, :role, :is_actual_present, :logo, :start_date, :end_date])
    |> validate_required([:name, :description, :role, :is_actual_present, :logo, :start_date, :end_date])
  end
end

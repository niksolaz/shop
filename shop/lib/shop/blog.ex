defmodule Shop.Blog do
  use Ecto.Schema
  import Ecto.Changeset
  @derive {Jason.Encoder, only: [:title, :description, :slug, :img]}

  schema "blogs" do
    field :description, :string
    field :title, :string
    field :slug, :string
    field :img, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(blog, attrs) do
    blog
    |> cast(attrs, [:title, :description, :slug, :img])
    |> validate_required([:title, :description, :slug, :img])
    |> unique_constraint(:slug)
  end
end

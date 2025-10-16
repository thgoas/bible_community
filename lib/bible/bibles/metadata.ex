defmodule Bible.Bibles.Metadata do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "metadata" do
    field :key, :string, primary_key: true
    field :value, :string
  end

  @doc false
  def changeset(metadata, attrs) do
    metadata
    |> cast(attrs, [:key, :value])
    |> validate_required([:key, :value])
  end
end

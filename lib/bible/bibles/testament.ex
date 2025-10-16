defmodule Bible.Bibles.Testament do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :integer, autogenerate: false}
  schema "testament" do
    field :name, :string
  end

  @doc false
  def changeset(testament, attrs) do
    testament
    |> cast(attrs, [:id, :name])
    |> validate_required([:id, :name])
  end
end

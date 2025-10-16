defmodule Bible.Bibles.Verse do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :integer, autogenerate: false}
  schema "verse" do
    field :book_id, :integer
    field :chapter, :integer
    field :verse, :integer
    field :text, :string
  end

  @doc false
  def changeset(verse, attrs) do
    verse
    |> cast(attrs, [:id, :book_id, :chapter, :verse, :text])
    |> validate_required([:id, :book_id, :chapter, :verse, :text])
  end
end

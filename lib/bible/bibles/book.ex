defmodule Bible.Bibles.Book do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :integer, autogenerate: false}
  schema "book" do
    field :book_reference_id, :integer
    field :testament_reference_id, :integer
    field :name, :string
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:id, :name, :book_reference_id, :testament_reference_id])
    |> validate_required([:id, :name, :book_reference_id, :testament_reference_id])
  end
end

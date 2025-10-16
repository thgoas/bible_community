defmodule Bible.Bibles do
  @moduledoc """
  The Bibles context.
  """

  import Ecto.Query, warn: false
  alias Bible.Repo

  alias Bible.Bibles.Book

  def list_books do
    Repo.all(Book)
  end

  def get_book!(id), do: Repo.get!(Book, id)

  def create_book(attrs \\ %{}) do
    %Book{}
    |> Book.changeset(attrs)
    |> Repo.insert()
  end

  def update_book(%Book{} = book, attrs) do
    book
    |> Book.changeset(attrs)
    |> Repo.update()
  end

  def delete_book(%Book{} = book) do
    Repo.delete(book)
  end

  def change_book(%Book{} = book, attrs \\ %{}) do
    Book.changeset(book, attrs)
  end

  alias Bible.Bibles.Metadata

  def list_metadatas do
    Repo.all(Metadata)
  end

  def get_metadata!(id), do: Repo.get!(Metadata, id)

  def create_metadata(attrs \\ %{}) do
    %Metadata{}
    |> Metadata.changeset(attrs)
    |> Repo.insert()
  end

  def update_metadata(%Metadata{} = metadata, attrs) do
    metadata
    |> Metadata.changeset(attrs)
    |> Repo.update()
  end

  def delete_metadata(%Metadata{} = metadata) do
    Repo.delete(metadata)
  end

  def change_metadata(%Metadata{} = metadata, attrs \\ %{}) do
    Metadata.changeset(metadata, attrs)
  end

  alias Bible.Bibles.Testament

  def list_testaments do
    Repo.all(Testament)
  end

  def get_testament!(id), do: Repo.get!(Testament, id)

  def create_testament(attrs \\ %{}) do
    %Testament{}
    |> Testament.changeset(attrs)
    |> Repo.insert()
  end

  def update_testament(%Testament{} = testament, attrs) do
    testament
    |> Testament.changeset(attrs)
    |> Repo.update()
  end

  def delete_testament(%Testament{} = testament) do
    Repo.delete(testament)
  end

  def change_testament(%Testament{} = testament, attrs \\ %{}) do
    Testament.changeset(testament, attrs)
  end

  alias Bible.Bibles.Verse

  def list_verses do
    Repo.all(Verse)
  end

  def list_verses_by_book(book_id) do
    query = from v in Verse,
            where: v.book_id == ^book_id,
            order_by: [asc: v.chapter, asc: v.verse]
    Repo.all(query)
  end

  def get_verse!(id), do: Repo.get!(Verse, id)

  def create_verse(attrs \\ %{}) do
    %Verse{}
    |> Verse.changeset(attrs)
    |> Repo.insert()
  end

  def update_verse(%Verse{} = verse, attrs) do
    verse
    |> Verse.changeset(attrs)
    |> Repo.update()
  end

  def delete_verse(%Verse{} = verse) do
    Repo.delete(verse)
  end

  def change_verse(%Verse{} = verse, attrs \\ %{}) do
    Verse.changeset(verse, attrs)
  end
end

defmodule Bible.Repo.Migrations.CreateVerse do
  use Ecto.Migration

  def change do
    create table(:verse, primary_key: false) do
      add :id, :integer, primary_key: true
      add :book_id, references(:book, on_delete: :nothing, type: :integer)
      add :chapter, :float
      add :verse, :integer
      add :text, :text
    end
  end
end

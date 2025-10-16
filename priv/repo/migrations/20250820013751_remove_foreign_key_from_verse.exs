defmodule Bible.Repo.Migrations.RemoveForeignKeyFromVerse do
  use Ecto.Migration

  def up do
    alter table(:verse) do
      modify :book_id, :integer, from: references(:book, on_delete: :nothing, type: :integer)
    end
  end

  def down do
    alter table(:verse) do
      modify :book_id, references(:book, on_delete: :nothing, type: :integer)
    end
  end
end

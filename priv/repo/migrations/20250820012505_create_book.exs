defmodule Bible.Repo.Migrations.CreateBook do
  use Ecto.Migration

  def change do
    create table(:book, primary_key: false) do
      add :id, :integer, primary_key: true
      add :book_reference_id, :integer
      add :testament_reference_id, :integer
      add :name, :text
    end
  end
end

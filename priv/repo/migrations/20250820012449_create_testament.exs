defmodule Bible.Repo.Migrations.CreateTestament do
  use Ecto.Migration

  def change do
    create table(:testament, primary_key: false) do
      add :id, :integer, primary_key: true
      add :name, :text
    end
  end
end

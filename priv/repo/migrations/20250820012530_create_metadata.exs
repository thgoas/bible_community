defmodule Bible.Repo.Migrations.CreateMetadata do
  use Ecto.Migration

  def change do
    create table(:metadata, primary_key: false) do
      add :key, :text, primary_key: true
      add :value, :text
    end
  end
end

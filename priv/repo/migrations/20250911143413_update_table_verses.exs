defmodule Bible.Repo.Migrations.UpdateTableVerses do
  use Ecto.Migration

  def change do
    alter table(:verse) do
      modify :chapter, :integer
    end
  end
end

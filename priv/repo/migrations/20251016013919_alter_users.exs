defmodule Bible.Repo.Migrations.AlterUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :name, :text
      add :surname, :text
      add :phone, :text
      add :avatar_url, :text
      add :congregation, :text
    end
  end
end

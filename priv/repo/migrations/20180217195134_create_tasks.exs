defmodule Tracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string, null: false
      add :body, :string, null: false
      add :duration, :integer
      add :completed, :boolean, default: false, null: false
      add :creator, references(:users, on_delete: :delete_all), null: false
      add :assignee, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end
  end
end

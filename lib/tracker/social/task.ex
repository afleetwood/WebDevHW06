defmodule Tracker.Social.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tracker.Social.Task

  schema "tasks" do
    field :body, :string
    field :completed, :boolean, default: false
    field :duration, :integer
    field :title, :string
    belongs_to :creator, Tracker.Accounts.User
    belongs_to :assignee, Tracker.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :body, :duration, :completed, :creator_id, :assignee_id])
    |> validate_required([:title, :body, :duration, :completed, :creator_id, :assignee_id])
  end
end

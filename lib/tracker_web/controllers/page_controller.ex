defmodule TrackerWeb.PageController do
  use TrackerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def feed(conn, _params) do
    tasks = Tracker.Social.list_tasks()
    changeset = Tracker.Social.change_task(%Tracker.Social.Task{})
    render conn, "feed.html", tasks: tasks, changeset: changeset
  end
end

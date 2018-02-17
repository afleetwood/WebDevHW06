defmodule TrackerWeb.Router do
  use TrackerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :get_current_user
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Used by the browser pipeline above
  # Should be moved out of router.ex later
  def get_current_user(conn, _params) do
    user_id = get_session(conn, :user_id)
    user = Tracker.Accounts.get_user(user_id || -1)
    assign(conn, :current_user, user)
  end

  scope "/", TrackerWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/tasks", TaskController
    post "/session", SessionController, :create
    delete "/session", SessionController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", TrackerWeb do
  #   pipe_through :api
  # end
end

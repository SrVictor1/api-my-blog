defmodule Api.Blog.Users.GetAll do
  alias Api.Repo
  alias Api.Blog.User

  def call() do
    User
    |> Repo.all()
  end
end

defmodule Api.Blog.Users.Create do
  def call(params) do
    params
    |> Api.Blog.User.changeset()
    |> Api.Repo.insert()
  end
end

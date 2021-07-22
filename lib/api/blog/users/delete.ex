defmodule Api.Blog.Users.Delete do
  alias Api.Repo
  alias Api.Blog.Users.GetOne

  def call(id) do
    GetOne.call(id)
    |> case do
      :error ->
        :error

      params ->
        Repo.delete(params)
    end
  end
end

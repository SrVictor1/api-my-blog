defmodule Api.Blog.Users.Create do
  def call(params) do
    params
    |> Api.Blog.User.changeset()
    |> case do
      data when data.valid? == true ->
        Api.Repo.insert(data)
      data ->
        {:error, data}
    end
  end
end

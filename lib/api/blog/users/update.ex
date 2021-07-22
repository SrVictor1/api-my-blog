defmodule Api.Blog.Users.Update do
  alias Api.Repo
  alias Ecto.Changeset
  alias Api.Blog.Users.GetOne

  def call(id, params) do
    data = GetOne.call(id)
    |> Changeset.change(params)
    
    case Api.Blog.User.changeset(params) do
      verificar when verificar.valid? == true ->
        Repo.update(data)

      _ ->
        :error
    end
  end
end

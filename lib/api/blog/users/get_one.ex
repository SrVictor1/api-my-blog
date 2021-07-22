defmodule Api.Blog.Users.GetOne do
  alias Api.Repo
  alias Api.Blog.User
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      {:ok, uuid} ->
        busca_user(uuid)

      :error ->
        :error
    end
  end

  defp busca_user(uuid) do
    Repo.get(User, uuid)
    |> case do
      nil ->
        :error

      params ->
        params
    end
  end
end

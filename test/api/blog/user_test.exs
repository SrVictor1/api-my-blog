defmodule Api.Blog.UserTest do
  alias Api.Blog.Users
  use Api.DataCase, async: true

  @valid_params %{
    name: "Victor",
    email: "victor@test.com",
    password: "123456789",
    posts_number: 1
  }

  @invalid_params %{
    name: nil,
    email: nil,
    password: nil,
    posts_number: nil
  }

  @update_params %{
    name: "Victor2",
    email: "victor@test2.com",
    password: "v2123456789",
    posts_number: 2
  }

  defp create_user_params(params) do
    Users.Create.call(params)
  end

  defp get_user_id() do
    {:ok, %Api.Blog.User{} = user} = create_user_params(@valid_params)
    user.id
  end

  # Create Test
  test "create_user/1 with valid data create a user" do
    {:ok, %Api.Blog.User{} = user} = create_user_params(@valid_params)
    assert user.name == "Victor"
    assert user.email == "victor@test.com"
    assert user.password == "123456789"
    assert user.posts_number == 1
  end

  test "create_user/1 with invalid data create a user" do
    assert {:error, %Ecto.Changeset{}} = create_user_params(@invalid_params)
  end

  # * Delete Test
  test "delete_user/1 passando um id valido" do
    assert {:ok, %Api.Blog.User{}} = Users.Delete.call(get_user_id())
  end

  test "delete_user/1 passando um id de um user invalido" do
    assert :error = Users.Delete.call("75f2f29c-2332-4954-b6e0-ff8004ad2b8d")
  end

  # * Update Test
  test "update_user/2 passando um params valido" do
    assert {:ok, %Api.Blog.User{}} = Users.Update.call(get_user_id(), @update_params)
  end

  test "update_user/2 passando um user invalido" do
    assert :error = Users.Update.call(get_user_id(), @invalid_params)
  end

  test "get_all_user/0 testando o retorno de uma lista de users" do
    assert [] = Users.GetAll.call()
  end
end

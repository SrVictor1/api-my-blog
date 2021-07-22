defmodule ApiWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation
  # alias ApiWeb.Resolver.Posts.{GetAllResolver, CreateResolver}
  alias ApiWeb.Resolver.Users

  import_types ApiWeb.Schema.Types.Users
  import_types ApiWeb.Schema.Types.Posts
  import_types ApiWeb.Schema.Types.Custom.UUID4

  object(:root_query) do
    field :get_all_users, list_of(:users) do
      resolve &Users.GetAllResolver.call/3
    end
  end

  object(:root_mutation) do
    field :create_user, type: :users do
      arg :input, :create_user
      resolve &Users.CreateUserResolve.call/3
    end
  end
end

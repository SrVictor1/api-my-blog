defmodule ApiWeb.Resolver.Users.CreateUserResolve do
  alias Api.Blog.Users.Create

  def call(_parent, %{input: %{} = args}, _resolution) do
    IO.inspect(args)
    Create.call(args)
  end
end

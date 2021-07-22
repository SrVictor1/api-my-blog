defmodule ApiWeb.Resolver.Users.GetAllResolver do
  def call(_parent, _args, _resolution) do
    {:ok, Api.Blog.Users.GetAll.call()}
  end
end

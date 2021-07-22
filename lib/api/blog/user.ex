defmodule Api.Blog.User do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:name, :email, :posts_number, :password]

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :posts_number, :integer, default: 0

    has_many :posts, Api.Blog.Post

    timestamps()
  end

  @doc false
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> unique_constraint([:email])
  end
end

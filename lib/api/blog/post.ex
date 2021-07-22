defmodule Api.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:user_id, :published, :title, :img_url, :body]

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary

  schema "posts" do
    field :title, :string
    field :img_url, :string
    field :body, :string
    field :published, :string

    belongs_to :user, Api.Blog.User

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end

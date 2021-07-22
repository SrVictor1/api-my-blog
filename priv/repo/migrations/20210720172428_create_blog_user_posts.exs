defmodule Api.Repo.Migrations.CreateBlogUserPosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :img_url, :string
      add :body, :string
      add :published, :string
      add :user_id, references(:users)

      timestamps()
    end
  end
end

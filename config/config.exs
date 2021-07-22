# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :api,
  ecto_repos: [Api.Repo],
  generators: [binary_id: true]

# * Config for ecto binary id
config :api, Api.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :api, ApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bhQZ4OM+9PY99V+kre2zgU0BjQWPLS9KHJqMNcLuk9VyqnvbVoZSmkROcfoxHv56",
  render_errors: [view: ApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Api.PubSub,
  live_view: [signing_salt: "6UnY/UX7"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

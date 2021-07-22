FROM elixir:1.12.0-alpine

WORKDIR /elixir_api

RUN mix local.hex --force -y && mix local.rebar --force -y

RUN mix archive.install hex phx_new 1.5.9

COPY mix.exs ./
COPY mix.lock ./

RUN mix deps.get && mix compile

COPY ./ ./

EXPOSE 4000

CMD mix ecto.reset && mix phx.server
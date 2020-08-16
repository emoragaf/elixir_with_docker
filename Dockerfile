# base image elixer to start with
FROM hexpm/elixir:1.10.4-erlang-23.0.3-ubuntu-focal-20200703

RUN apt-get update && \
    apt-get install -y postgresql-client && \
    apt-get install -y inotify-tools && \
    apt-get install -y nodejs && \
    apt-get install -y curl && \
    curl -L https://npmjs.org/install.sh | sh && \
    mix local.hex --force && \
    mix archive.install hex phx_new 1.5.3 --force && \
    mix local.rebar --force

# create app folder
RUN mkdir /app
WORKDIR /app

CMD ["mix", "phx.server"]
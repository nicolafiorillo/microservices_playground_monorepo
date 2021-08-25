# Build: docker build -t service_a .
# Run:   docker run -e PORT=4000 -p 4000:4000 -t service_a

FROM bitwalker/alpine-elixir:1.12.2 as build

COPY . .

# Install Hex + Rebar
RUN mix do local.hex --force, local.rebar --force

RUN rm -Rf _build && \
    MIX_ENV=prod mix do deps.get, deps.compile, compile, release

FROM bitwalker/alpine-erlang:24.0.5

RUN apk upgrade --no-cache && \
    apk add --no-cache postgresql-client bash openssl libgcc libstdc++ ncurses-libs
    
COPY --from=build /opt/app/_build/prod/rel/service_a/ .

USER default

ENTRYPOINT ["bin/service_a"]
CMD ["start"]
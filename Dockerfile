FROM caddy:2.9-builder AS builder

RUN xcaddy build \
    --with github.com/caddyserver/cache-handler@v0.15.0 \
    --with github.com/dulli/caddy-wol

FROM caddy:2.9

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
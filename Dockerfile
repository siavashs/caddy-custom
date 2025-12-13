FROM caddy:2-builder AS builder

RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    xcaddy build \
    --with github.com/caddy-dns/cloudflare@v0.2.2 \
    --with github.com/invzhi/caddy-docker-upstreams@v1.0.0

FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

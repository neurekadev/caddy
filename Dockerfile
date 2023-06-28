ARG VERSION

FROM caddy:${VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddy-dns/google-domains

FROM caddy:${VERSION}

LABEL org.opencontainers.image.source https://github.com/douglasparker/caddy

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
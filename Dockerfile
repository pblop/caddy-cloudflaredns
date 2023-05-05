FROM caddy:builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare
    
RUN apk add ca-certificates

FROM caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

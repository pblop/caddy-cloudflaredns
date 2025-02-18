FROM caddy:builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-l4 \
    --with github.com/RussellLuo/caddy-ext/layer4
    
FROM caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

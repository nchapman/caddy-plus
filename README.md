# Caddy Plus

A custom Caddy Docker image with additional plugins pre-installed.

## Included Plugins

- [cache-handler](https://github.com/caddyserver/cache-handler) - HTTP caching handler module for Caddy
- [caddy-wol](https://github.com/dulli/caddy-wol) - Wake-on-LAN plugin for Caddy

## Usage

```bash
docker pull ghcr.io/nchapman/caddy-plus:latest
```

Example docker-compose.yml:

```yaml
services:
  caddy:
    image: ghcr.io/nchapman/caddy-plus:latest
    ports:
      - "80:80"
      - "443:443"
      - "443:443/udp" # For HTTP/3 support
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile:ro
      - caddy_data:/data
    restart: unless-stopped

volumes:
  caddy_data:
```

## Development

To build locally:

```bash
docker build -t caddy-plus .
```

## License

MIT License

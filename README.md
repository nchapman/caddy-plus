# Caddy Plus

A custom Caddy Docker image with additional plugins pre-installed.

## Included Plugins

- [cache-handler](https://github.com/caddyserver/cache-handler) - HTTP caching handler module for Caddy
- [caddy-wol](https://github.com/dulli/caddy-wol) - Wake-on-LAN plugin for Caddy

## Usage

```bash
docker pull ghcr.io/nchapman/caddy-plus:latest
```

## Development

To build locally:

```bash
docker build -t caddy-plus .
```

## License

MIT License

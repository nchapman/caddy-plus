# Caddy Plus

A custom Caddy Docker image with additional plugins pre-installed. Rebuilt weekly to stay current.

## Included Plugins

- [coraza-caddy](https://github.com/corazawaf/coraza-caddy) - Web Application Firewall with OWASP Core Rule Set
- [cache-handler](https://github.com/caddyserver/cache-handler) - HTTP caching handler module
- [caddy-wol](https://github.com/dulli/caddy-wol) - Wake-on-LAN plugin

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
      - "443:443/udp"
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile:ro
      - caddy_data:/data
    restart: unless-stopped

volumes:
  caddy_data:
```

Example Caddyfile with Coraza WAF:

```caddyfile
{
    order coraza_waf first
}

(coraza) {
    coraza_waf {
        load_owasp_crs
        directives `
            Include @coraza.conf-recommended
            Include @crs-setup.conf.example
            Include @owasp_crs/*.conf
            SecRuleEngine On
        `
    }
}

example.com {
    import coraza
    reverse_proxy backend:8080
}
```

## Updates

The image is automatically rebuilt every Sunday at 3am UTC to pull in the latest Caddy and plugin updates.

## License

MIT License

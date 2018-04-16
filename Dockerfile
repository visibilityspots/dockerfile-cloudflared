FROM falkenssmaze/cloudflared-alpine

LABEL maintainer="Jan Collijs"

CMD ["/bin/sh", "-c", "/usr/local/bin/cloudflared proxy-dns --address 0.0.0.0 --port 54 --upstream https://1.1.1.1/.well-known/dns-query --upstream https://1.0.0.1/.well-known/dns-query"]

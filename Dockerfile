ARG ARCH
FROM golang:alpine as gobuild

ARG GOARCH
ARG GOARM

RUN apk update; \
    apk add git gcc build-base; \
    go get -v github.com/cloudflare/cloudflared/cmd/cloudflared

WORKDIR /go/src/github.com/cloudflare/cloudflared/cmd/cloudflared

RUN GOARCH=${GOARCH} GOARM=${GOARM} go build ./

FROM multiarch/alpine:${ARCH}-edge

LABEL maintainer="Jan Collijs"

ENV DNS1 1.1.1.1
ENV DNS2 1.0.0.1

RUN adduser -S cloudflared; \
        apk add --no-cache ca-certificates bind-tools; \
        rm -rf /var/cache/apk/*;

COPY --from=gobuild /go/src/github.com/cloudflare/cloudflared/cmd/cloudflared/cloudflared /usr/local/bin/cloudflared
HEALTHCHECK --interval=5s --timeout=3s --start-period=5s CMD nslookup -po=5054 cloudflare.com 127.0.0.1 || exit 1

USER cloudflared

CMD ["/bin/sh", "-c", "/usr/local/bin/cloudflared proxy-dns --address 0.0.0.0 --port 5054 --upstream https://${DNS1}/.well-known/dns-query --upstream https://${DNS2}/.well-known/dns-query"]

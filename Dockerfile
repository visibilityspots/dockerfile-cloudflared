ARG GOLANG_VERSION=1.23.2
ARG ALPINE_VERSION=3.20
ARG UPSTREAM_RELEASE_TAG=2024.10.0

FROM golang:${GOLANG_VERSION}-alpine${ALPINE_VERSION} AS gobuild
ARG GOLANG_VERSION
ARG ALPINE_VERSION
ARG UPSTREAM_RELEASE_TAG

WORKDIR /tmp

RUN apk add --no-cache gcc build-base curl tar && \
    mkdir release && \
    curl -L "https://github.com/cloudflare/cloudflared/archive/refs/tags/${UPSTREAM_RELEASE_TAG}.tar.gz" | tar xvz --strip 1 -C ./release

WORKDIR /tmp/release/cmd/cloudflared

RUN go build -ldflags="-X 'main.Version=$UPSTREAM_RELEASE_TAG' -X 'main.BuildTime=$(date +%B\ %Y)'"

FROM alpine:${ALPINE_VERSION}

ARG GOLANG_VERSION
ARG ALPINE_VERSION

LABEL maintainer="Jan Collijs"

ENV UPSTREAM1=https://1.1.1.1/dns-query
ENV UPSTREAM2=https://1.0.0.1/dns-query
ENV PORT=5054
ENV ADDRESS=0.0.0.0
ENV METRICS=127.0.0.1:8080
ENV MAX_UPSTREAM_CONNS=0

RUN adduser -S cloudflared; \
    apk add --no-cache ca-certificates bind-tools libcap tzdata; \
    rm -rf /var/cache/apk/*;

COPY --from=gobuild /tmp/release/cmd/cloudflared/cloudflared /usr/local/bin/cloudflared

RUN setcap CAP_NET_BIND_SERVICE+eip /usr/local/bin/cloudflared

HEALTHCHECK --interval=5s --timeout=3s --start-period=5s CMD nslookup -po=${PORT} cloudflare.com 127.0.0.1 || exit 1

USER cloudflared

CMD ["/bin/sh", "-c", "/usr/local/bin/cloudflared proxy-dns --address ${ADDRESS} --port ${PORT} --metrics ${METRICS} --upstream ${UPSTREAM1} --upstream ${UPSTREAM2} --max-upstream-conns ${MAX_UPSTREAM_CONNS}"]

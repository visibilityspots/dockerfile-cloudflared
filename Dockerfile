ARG ALPINE_VERSION=3.16
ARG GOLANG_VERSION=1.18.3
ARG CLOUDFLARED_VERSION=2022.5.3
ARG XX_VERSION=1.1.1

FROM --platform=${BUILDPLATFORM:-linux/amd64} tonistiigi/xx:${XX_VERSION} AS xx
FROM --platform=${BUILDPLATFORM:-linux/amd64} golang:${GOLANG_VERSION}-alpine AS gobuild
RUN apk --update --no-cache add file git
COPY --from=xx / /
WORKDIR /src
ARG CLOUDFLARED_VERSION
RUN git clone --branch ${CLOUDFLARED_VERSION} https://github.com/cloudflare/cloudflared .
ARG TARGETPLATFORM
ENV GO111MODULE=on
ENV CGO_ENABLED=0
RUN xx-go build -v -mod=vendor -trimpath -o /bin/cloudflared \
    -ldflags="-w -s -X 'main.Version=${CLOUDFLARED_VERSION}' -X 'main.BuildTime=$(date)'" \
    ./cmd/cloudflared \
  && xx-verify --static /bin/cloudflared

FROM alpine:${ALPINE_VERSION}

ARG GOLANG_VERSION
ARG ALPINE_VERSION

LABEL maintainer="Jan Collijs"

ENV UPSTREAM1 https://1.1.1.1/dns-query
ENV UPSTREAM2 https://1.0.0.1/dns-query
ENV PORT 5054
ENV ADDRESS 0.0.0.0
ENV METRICS 127.0.0.1:8080
ENV MAX_UPSTREAM_CONNS 0

RUN adduser -S cloudflared; \
    apk add --no-cache ca-certificates bind-tools libcap tzdata; \
    rm -rf /var/cache/apk/*;

COPY --from=gobuild /bin/cloudflared /usr/local/bin/cloudflared

RUN setcap CAP_NET_BIND_SERVICE+eip /usr/local/bin/cloudflared

HEALTHCHECK --interval=5s --timeout=3s --start-period=5s CMD nslookup -po=${PORT} cloudflare.com 127.0.0.1 || exit 1

USER cloudflared

CMD ["/bin/sh", "-c", "/usr/local/bin/cloudflared proxy-dns --address ${ADDRESS} --port ${PORT} --metrics ${METRICS} --upstream ${UPSTREAM1} --upstream ${UPSTREAM2} --max-upstream-conns ${MAX_UPSTREAM_CONNS}"]

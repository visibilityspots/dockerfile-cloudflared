# Cloudflared

[![build status](https://github.com/visibilityspots/dockerfile-cloudflared/actions/workflows/main.yaml/badge.svg)](https://github.com/visibilityspots/dockerfile-cloudflared/actions/workflows/main.yaml)
[![docker image size](https://img.shields.io/docker/image-size/visibilityspots/cloudflared/latest)](https://hub.docker.com/r/visibilityspots/cloudflared)
[![docker pulls](https://img.shields.io/docker/pulls/visibilityspots/cloudflared.svg)](https://hub.docker.com/r/visibilityspots/cloudflared/)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

a docker container which runs the [cloudflared](https://developers.cloudflare.com/1.1.1.1/dns-over-https/cloudflared-proxy/) proxy-dns at port 5054 based on alpine with some parameters to enable DNS over HTTPS proxy for [pi-hole](https://pi-hole.net/) based on tutorials from [Oliver Hough](https://oliverhough.cloud/blog/configure-pihole-with-dns-over-https/) and [Scott Helme](https://scotthelme.co.uk/securing-dns-across-all-of-my-devices-with-pihole-dns-over-https-1-1-1-1/)

## run

```
$ docker run --name cloudflared --rm --net host visibilityspots/cloudflared:latest
```

### run with docker-compose

```
$ docker-compose up
```

### custom upstream DNS service

```
$ docker run --name cloudflared --rm --net host -e UPSTREAM1=https://dns.google/dns-query visibilityspots/cloudflared:latest
```

### custom port

```
$ docker run --name cloudflared --rm --net host -e PORT=5053 visibilityspots/cloudflared:latest
```

### dualstack ipv4/ipv6

```
$ docker run --name cloudflared --rm --net host -e ADDRESS=:: visibilityspots/cloudflared:latest
```

### limit connections to upstream dns servers

```
$ docker run --name cloudflared --rm --net host -e MAX_UPSTREAM_CONNS=5 visibilityspots/cloudflared:latest
```

## test

```
$ dig +short @10.0.0.2 -p 5054 visibilityspots.org
13.225.238.129
13.225.238.53
13.225.238.9
13.225.238.61
```

## build

```
$ docker build -t visibilityspots/cloudflared:latest .
```

### buildx

```
$ docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
$ docker buildx build -t visibilityspots/cloudflared:latest --platform linux/amd64,linux/arm/v6,linux/arm/v7 --push .
```

### dgoss

I wrote some tests in a goss.yaml file which can be executed by [dgoss](https://github.com/aelsabbahy/goss/tree/master/extras/dgoss) to test the created image

```
$ dgoss run --name cloudflared --rm -ti visibilityspots/cloudflared:latest
INFO: Starting docker container
INFO: Container ID: e5bd35d3
INFO: Sleeping for 0.2
INFO: Running Tests
Process: cloudflared: running: matches expectation: [true]
Package: ca-certificates: installed: matches expectation: [true]
Command: cloudflared --version | head -1: exit-status: matches expectation: [0]
Command: cloudflared --version | head -1: stdout: matches expectation: [cloudflared version DEV (built unknown)]


Total Duration: 0.028s
Count: 4, Failed: 0, Skipped: 0
INFO: Deleting container
```

## License

Distributed under the MIT license

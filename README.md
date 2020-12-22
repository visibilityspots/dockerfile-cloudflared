# Cloudflared

[![]Build Status(https://github.com/visibilityspots/dockerfile-cloudflared/workflows/CI/badge.svg)](https://github.com/visibilityspots/dockerfile-cloudflared/actions)
[![](https://images.microbadger.com/badges/image/visibilityspots/cloudflared:amd64.svg)](https://microbadger.com/images/visibilityspots/cloudflared:amd64)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Docker Pulls](https://img.shields.io/docker/pulls/visibilityspots/cloudflared.svg)](https://hub.docker.com/r/visibilityspots/cloudflared/)

a docker container which runs the [cloudflared](https://developers.cloudflare.com/1.1.1.1/dns-over-https/cloudflared-proxy/) proxy-dns at port 5054 based on alpine with some parameters to enable DNS over HTTPS proxy for [pi-hole](https://pi-hole.net/) based on tutorials from [Oliver Hough](https://oliverhough.cloud/blog/configure-pihole-with-dns-over-https/) and [Scott Helme](https://scotthelme.co.uk/securing-dns-across-all-of-my-devices-with-pihole-dns-over-https-1-1-1-1/)

## run

```docker run --name cloudflared --rm --net host visibilityspots/cloudflared```

### run with docker-compose

```docker-compose up -d```

### custom upstream DNS

```docker run --name cloudflared --rm --net host -e DNS1=#.#.#.# -e DNS2=#.#.#.# visibilityspots/cloudflared```

### custom port

```docker run --name cloudflared --rm --net host -e PORT=5053 visibilityspots/cloudflared```

### dualstack ipv4/ipv6

```docker run --name cloudflared --rm --net host -e ADDRESS :: visibilityspots/cloudflared```

## test

I wrote some tests in a goss.yaml file which can be executed by [dgoss](https://github.com/aelsabbahy/goss/tree/master/extras/dgoss)

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

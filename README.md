# Cloudflared

[![trivy](https://github.com/visibilityspots/dockerfile-cloudflared/actions/workflows/trivy.yml/badge.svg)](https://github.com/visibilityspots/dockerfile-cloudflared/actions/workflows/trivy.yml)
[![docker-hub-description](https://github.com/visibilityspots/dockerfile-cloudflared/actions/workflows/docker-hub-description.yml/badge.svg)](https://github.com/visibilityspots/dockerfile-cloudflared/actions/workflows/docker-hub-description.yml)
[![build status](https://github.com/visibilityspots/dockerfile-cloudflared/actions/workflows/main.yaml/badge.svg)](https://github.com/visibilityspots/dockerfile-cloudflared/actions/workflows/main.yaml)
[![gitHub release](https://img.shields.io/github/v/release/visibilityspots/dockerfile-cloudflared)](https://github.com/visibilityspots/dockerfile-cloudflared/releases)
[![docker image size](https://img.shields.io/docker/image-size/visibilityspots/cloudflared/latest)](https://hub.docker.com/r/visibilityspots/cloudflared)
[![docker pulls](https://img.shields.io/docker/pulls/visibilityspots/cloudflared.svg)](https://hub.docker.com/r/visibilityspots/cloudflared/)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fvisibilityspots%2Fdockerfile-cloudflared.svg?type=shield&issueType=license)](https://app.fossa.com/projects/git%2Bgithub.com%2Fvisibilityspots%2Fdockerfile-cloudflared?ref=badge_shield&issueType=license)

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

Build against pinned upstream release
```
$ docker build -t visibilityspots/cloudflared:latest .
```

Build against a specific upstream release
```
$ docker build -t visibilityspots/cloudflared:latest . --build-arg UPSTREAM_RELEASE_TAG=2021.5.10
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
INFO: Container ID: 792bc39d
INFO: Sleeping for 0.2
INFO: Container health
INFO: Running Tests
User: cloudflared: exists: matches expectation: true
Process: cloudflared: running: matches expectation: true
Command: uname -a: exit-status: matches expectation: 0
Command: cloudflared --version: exit-status: matches expectation: 0
Command: cloudflared --version: stdout: matches expectation: ["cloudflared version 2023.8.2 (built September 2023)"]
Package: ca-certificates: installed: matches expectation: true
DNS: visibilityspots.org: resolvable: matches expectation: true


Total Duration: 0.092s
Count: 7, Failed: 0, Skipped: 0
INFO: Deleting container
```

### act

using [act](https://github.com/nektos/act#overview----) for local testing of the written github actions makes my life and commit history a lot easier;

```
$ act -l
Stage  Job ID  Job name  Workflow name  Workflow file  Events
0      test    test      CI             main.yaml      push
1      buildx  buildx    CI             main.yaml      push

$ act -j test
[CI/test] 🚀  Start image=catthehacker/ubuntu:act-latest
.
.
.
[CI/test]   ✅  Success - Main Execute Goss tests
[CI/test] 🏁  Job succeeded
```

## License

Distributed under the [MIT license](https://github.com/visibilityspots/dockerfile-cloudflared/blob/master/LICENSE)

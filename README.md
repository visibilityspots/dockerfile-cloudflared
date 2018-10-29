# Cloudflared

[![Build Status](https://travis-ci.org/visibilityspots/dockerfile-cloudflared.svg?branch=master)](https://travis-ci.org/visibilityspots/dockerfile-cloudflared) [![Anchore Image Overview](https://anchore.io/service/badges/image/83a10eecc520e2b85fc8861ca106ae3ef6e8e7509010f8509e2a0131750dd450)](https://anchore.io/image/dockerhub/visibilityspots%2Fcloudflared%3Alatest)

a docker container which runs the [cloudflared](https://developers.cloudflare.com/1.1.1.1/dns-over-https/cloudflared-proxy/) proxy-dns at port 54 based on alpine with some parameters to enable DNS over HTTPS proxy for [pi-hole](https://pi-hole.net/) based on tutorials from [Oliver Hough](https://oliverhough.cloud/blog/configure-pihole-with-dns-over-https/) and [Scott Helme](https://scotthelme.co.uk/securing-dns-across-all-of-my-devices-with-pihole-dns-over-https-1-1-1-1/)

## run

```docker run --name cloudflared --rm --net host visibilityspots/cloudflared```

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

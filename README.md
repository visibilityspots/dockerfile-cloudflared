# Cloudflared

[![Build Status](https://travis-ci.org/visibilityspots/dockerfile-cloudflared.svg?branch=master)](https://travis-ci.org/visibilityspots/dockerfile-cloudflared)

a docker container which runs the [cloudflared](https://developers.cloudflare.com/1.1.1.1/dns-over-https/cloudflared-proxy/) proxy-dns at port 54 based on alpine with some parameters to enable DNS over HTTPS proxy for [pi-hole](https://pi-hole.net/) based om tutorials from [Oliver Hough](https://oliverhough.cloud/blog/configure-pihole-with-dns-over-https/) and [Scott Helme](https://scotthelme.co.uk/securing-dns-across-all-of-my-devices-with-pihole-dns-over-https-1-1-1-1/)

## run

```docker run --name cloudflared --rm --net host visibilityspots/cloudflared```

## test

I wrote some tests in a goss.yaml file which can be executed by [dgoss](https://github.com/aelsabbahy/goss/tree/master/extras/dgoss)

```
INFO: Starting docker container
INFO: Container ID: 7874bf4c
INFO: Sleeping for 0.2
INFO: Running Tests
Process: cloudflared: running: matches expectation: [true]
Command: cloudflared --version | head -1: exit-status: matches expectation: [0]
Command: cloudflared --version | head -1: stdout: matches expectation: [cloudflared version DEV (built unknown)]


Total Duration: 0.015s
Count: 3, Failed: 0, Skipped: 0
INFO: Deleting container
```

## License
Distributed under the MIT license

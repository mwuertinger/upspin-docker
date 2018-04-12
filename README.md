[![Build Status](https://travis-ci.org/mwuertinger/upspinserver.svg?branch=master)](https://travis-ci.org/mwuertinger/upspinserver)
# Dockerized Upspinserver
This repository contains a `Dockerfile` which allows to package `upspinserver`
in a Docker image in order to simplify distribution.

## What is Upspin?
According to the project's [documentation](https://github.com/upspin/upspin):
Upspin is an experimental project to build a framework for naming and sharing
files and other data securely, uniformly, and globally: a global name system of sorts.

## How to build
```
docker build -t mwuertinger/upspinserver .
```
The image is built automatically by
[TravisCI](https://travis-ci.org/mwuertinger/upspinserver) at least once a day
and the resulting images are pushed to
[Docker Hub](https://hub.docker.com/r/mwuertinger/upspinserver/).

## How to run
This configuration of `upspinserver` uses the local filesystem to store all of
its data. Therefore you need to map a local directory into the container at the
`/upspin` location.

```
docker run \
  -v /local/path/to/upspin:/upspin \
  -p 443:443 -p 80:80 \
  mwuertinger/upspinserver:latest
```

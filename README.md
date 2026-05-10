# Buildroot for Raspberry Pi 4

This repo maintains a Dockerfile for building a customized linux embedded image for the
Raspberry Pi 4 (aarch64, cortex_a72).

It consists of a series of configurations, assets, patches, and a custom rootfs
for [buildroot](https://gitlab.com/buildroot.org/buildroot/).

## Configuring

## Building

```console
docker build -t buildroot .
docker run --rm -it buildroot

$ make
```

```console
docker run -it --name buildroot_1 -v $(pwd):/mounted buildroot /bin/bash

docker start -ai buildroot_1
```

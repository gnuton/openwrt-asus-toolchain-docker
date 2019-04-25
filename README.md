# openwrt-asus-toolchain-docker
Docker image with toolchains needed to build openwrt asus images


## Use this docker image
The following command will run a docker container containing the toolchain to build openwrt for the supported targets.

```bash
docker run -it -v /path/to/openwrt/source/code/to/build:/build gnuton/openwrt-asus-toolchains-docker /bin/bash
```

## Build the docker file
```bash
docker build .
```

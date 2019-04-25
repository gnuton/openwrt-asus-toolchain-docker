FROM ubuntu:16.04
MAINTAINER Antonio Aloisio <gnuton@gnuton.org>

env DEBIAN_FRONTEND noninteractive

WORKDIR /build

ADD crosstools-arm-gcc-4.6-linux-3.4-uclibc-0.9.32-binutils-2.21-NPTL.Rel1.2.tar.bz2 /
RUN \
    useradd -ms /bin/bash builder && \
    dpkg --add-architecture i386 && \
    apt update && \
    apt install -y make gcc git g++ gettext libncurses5 unzip bzip2 python wget subversion libncurses5-dev zlib1g-dev gawk && \
    ln -sf bash /bin/sh

USER builder

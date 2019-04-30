FROM ubuntu:16.04
MAINTAINER Antonio Aloisio <gnuton@gnuton.org>

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8

WORKDIR /build

ADD crosstools-arm-gcc-4.6-linux-3.4-uclibc-0.9.32-binutils-2.21-NPTL.Rel1.2.tar.bz2 /
RUN \
    useradd -ms /bin/bash builder && \
    dpkg --add-architecture i386 && \
    apt update && \
    apt install -y \
    make gcc git g++ gettext libncurses5 unzip bzip2 python wget \
    subversion libncurses5-dev zlib1g-dev gawk locales && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8 && \
    ln -sf bash /bin/sh


USER builder

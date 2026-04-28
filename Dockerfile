FROM debian:12.13-slim

USER root

RUN : \
    && apt update \
    && apt install -y \
        git \
        bc \
        wget \
        bison \
        flex \
        libssl-dev \
        make \
        libc6-dev \
        libncurses5-dev \
        build-essential \
        crossbuild-essential-arm64 \
        crossbuild-essential-armhf \
    && useradd -m buildroot \
    && :

RUN : \
    && cd /tmp \
    && wget https://github.com/micro-editor/micro/releases/download/v2.0.15/micro-2.0.15-linux64-static.tar.gz \
    && tar xf micro-2.0.15-linux64-static.tar.gz \
    && mv ./micro-2.0.15/micro /usr/bin \
    && rm -rf ./micro-2.0.15

USER buildroot
WORKDIR /home/buildroot/

RUN : \
    && wget https://buildroot.org/downloads/buildroot-2026.02.1.tar.gz \
    && tar xf ./buildroot-2026.02.1.tar.gz \
    && rm -rf ./buildroot-2026.02.1.tar.gz


COPY --chown=1000:1000 .config/micro .config/micro

WORKDIR /home/buildroot/buildroot-2026.02.1

COPY --chown=1000:1000 myboard_defconfig configs/myboard_defconfig
COPY --chown=1000:1000 board/ /tmp/board/

RUN : \
    && rm board/raspberrypi4-64 \
    && cp -r board/raspberrypi board/raspberrypi4-64 \
    && cp -a /tmp/board/. ./board \
    && rm -rf /tmp/board \
    && make raspberrypi4_64_defconfig

CMD [ "/bin/bash" ]

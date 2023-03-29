ARG BASE

FROM ${BASE}

ARG AUTHOR
ARG VERSION

LABEL maintainer=${AUTHOR} version=${VERSION}

ARG TARGETOS
ARG TARGETARCH

RUN apt update -y && \
apt-get install -y \
build-essential \
automake \
libtool \
libevent-dev \
libncurses5-dev \
libmsgpack-dev \
libssh-dev \
pkg-config \
wget \
cmake

RUN set -ex; \
            mkdir -p /src/libssh/build; \
            cd /src; \
            wget -O libssh.tar.xz https://dl.wodcloud.com/drone/libssh-0.9.0.tar.xz; \
            tar -xf libssh.tar.xz -C /src/libssh --strip-components=1; \
            cd /src/libssh/build; \
            cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
            -DWITH_SFTP=OFF -DWITH_SERVER=OFF -DWITH_PCAP=OFF \
            -DWITH_STATIC_LIB=ON -DWITH_GSSAPI=OFF ..; \
            make -j $(nproc); \
            make install

ARG BASE

FROM ${BASE}

ARG AUTHOR
ARG VERSION

LABEL maintainer=${AUTHOR} version=${VERSION}

ARG TARGETOS
ARG TARGETARCH

RUN apt update -y && apt install -y wget cmake make gcc g++ lib32z1-dev \
            automake autoconf libevent-dev ncurses-dev libmsgpack-dev libexecs-dev \
            ncurses-static libexecinfo-static libevent-static msgpack-c ncurses-libs \
            libevent libexecs openssl lib32z1

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

# tmate

https://github.com/tmate-io/tmate

```bash
git remote add upstream git@github.com:tmate-io/tmate.git

git fetch upstream

git merge upstream/master
```

## debug

```bash
# builder-amd64
docker run -it --rm \
-v $PWD/:/go/src/github.com/tmate-io/tmate \
-w /go/src/github.com/tmate-io/tmate \
registry.cn-qingdao.aliyuncs.com/wod/tmate:builder-alpine-3.10-amd64 \
ash -c '
./autogen.sh && ./configure --enable-static && \
make clean && \
make -j $(nproc) && \
objcopy --only-keep-debug tmate tmate.symbols && strip tmate && \
./tmate -V && \
mkdir -p release/linux/amd64/ && \
mv tmate release/linux/amd64/tmate
'

# builder-arm64
docker run -it --rm \
-v $PWD/:/go/src/github.com/tmate-io/tmate \
-w /go/src/github.com/tmate-io/tmate \
registry.cn-qingdao.aliyuncs.com/wod/tmate:builder-alpine-3.10-arm64 \
ash -c '
./autogen.sh && ./configure --enable-static && \
make clean && \
make -j $(nproc) && \
objcopy --only-keep-debug tmate tmate.symbols && strip tmate && \
./tmate -V && \
mkdir -p release/linux/arm64/ && \
mv tmate release/linux/arm64/tmate
'

# builder-ppc64le
docker run -it --rm \
-v $PWD/:/go/src/github.com/tmate-io/tmate \
-w /go/src/github.com/tmate-io/tmate \
registry.cn-qingdao.aliyuncs.com/wod/tmate:builder-alpine-3.10-ppc64le \
ash -c '
./autogen.sh && ./configure --enable-static && \
make clean && \
make -j $(nproc) && \
objcopy --only-keep-debug tmate tmate.symbols && strip tmate && \
./tmate -V && \
mkdir -p release/linux/ppc64le/ && \
mv tmate release/linux/ppc64le/tmate
'

# builder-mips64le
docker run -it --rm \
-v $PWD/:/go/src/github.com/tmate-io/tmate \
-w /go/src/github.com/tmate-io/tmate \
registry.cn-qingdao.aliyuncs.com/wod/debian:bullseye-mips64le \
bash

docker run -it --rm \
-v $PWD/:/go/src/github.com/tmate-io/tmate \
-w /go/src/github.com/tmate-io/tmate \
registry.cn-qingdao.aliyuncs.com/wod/tmate:builder-debian-bullseye-mips64le \
bash -c '
./autogen.sh && 
./configure && \
make install && \
./tmate -v && \
mkdir -p release/linux/mips64le/ && \
mv tmate release/linux/mips64le/tmate
'
```

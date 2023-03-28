# version

```bash
git remote add upstream git@github.com:tmate-io/tmate.git

git fetch upstream

git merge 2.4.0
```

## debug

```bash
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

# builder-mips64
docker run -it --rm \
-v $PWD/:/go/src/github.com/tmate-io/tmate \
-w /go/src/github.com/tmate-io/tmate \
registry.cn-qingdao.aliyuncs.com/wod/tmate:builder-alpine-3.11-mips64le \
ash -c '
./autogen.sh && ./configure --enable-static && \
make -j $(nproc) && \
objcopy --only-keep-debug tmate tmate.symbols && strip tmate && \
./tmate -V && \
mkdir -p release/linux/mips64le/ && \
mv tmate release/linux/mips64le/tmate
'
```

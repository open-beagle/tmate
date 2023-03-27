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
registry.cn-qingdao.aliyuncs.com/wod/tmate:builder-alpine-3.11-arm64 \
ash -c '
./autogen.sh && ./configure --enable-static && \
make clean && \
make -j $(nproc) && \
objcopy --only-keep-debug tmate tmate.symbols && strip tmate && \
./tmate -V && \
mkdir -p release/linux/amd64/ && \
mv tmate release/linux/amd64/tmate
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
mkdir -p release/linux/amd64/ && \
mv tmate release/linux/amd64/tmate
'

# arm64
docker build \
  --build-arg BASE=registry.cn-qingdao.aliyuncs.com/wod/alpine:3.11-arm64 \
  --build-arg AUTHOR=mengkzhaoyun \
  --build-arg VERSION=2.4.0 \
  --build-arg TARGETARCH=amd64 \
  --tag registry.cn-qingdao.aliyuncs.com/wod/tmate:2.4.0-arm64 \
  --file .beagle/builder.dockerfile .

docker push registry.cn-qingdao.aliyuncs.com/wod/tmate:2.4.0-arm64

# mips64le
docker build \
  --build-arg BASE=registry.cn-qingdao.aliyuncs.com/wod/alpine:3.11-mips64le \
  --build-arg AUTHOR=mengkzhaoyun \
  --build-arg VERSION=2.4.0 \
  --build-arg TARGETARCH=amd64 \
  --tag registry.cn-qingdao.aliyuncs.com/wod/tmate:2.4.0-mips64le \
  --file .beagle/builder.dockerfile .

docker push registry.cn-qingdao.aliyuncs.com/wod/tmate:2.4.0-mips64le
```

# debug

```bash
# amd64
docker build \
  --build-arg BASE=registry.cn-qingdao.aliyuncs.com/wod/alpine:3.11-amd64 \
  --build-arg AUTHOR=mengkzhaoyun \
  --build-arg VERSION=builder-alpine-3.11 \
  --build-arg TARGETARCH=amd64 \
  --tag registry.cn-qingdao.aliyuncs.com/wod/tmate:builder-alpine-3.11-amd64 \
  --file .beagle/builder/dockerfile .beagle/builder/

docker push registry.cn-qingdao.aliyuncs.com/wod/tmate:builder-alpine-3.11-amd64

# debian-amd64
docker build \
  --build-arg BASE=registry.cn-qingdao.aliyuncs.com/wod/debian:bullseye-amd64 \
  --build-arg AUTHOR=mengkzhaoyun \
  --build-arg VERSION=debian-bullseye \
  --build-arg TARGETARCH=amd64 \
  --tag registry.cn-qingdao.aliyuncs.com/wod-arm/tmate-builder:debian-bullseye-amd64 \
  --file .beagle/builder/debian.dockerfile .beagle/builder/

docker push registry.cn-qingdao.aliyuncs.com/wod-arm/tmate-builder:debian-bullseye-amd64
```

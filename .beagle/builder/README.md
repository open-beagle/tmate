# debug

```bash
# amd64
docker build \
  --build-arg BASE=registry.cn-qingdao.aliyuncs.com/wod/alpine:3.10-amd64 \
  --build-arg AUTHOR=mengkzhaoyun \
  --build-arg VERSION=builder-alpine-3.10 \
  --build-arg TARGETARCH=amd64 \
  --tag registry.cn-qingdao.aliyuncs.com/wod/tmate:builder-alpine-3.10-amd64 \
  --file .beagle/builder/dockerfile .beagle/builder/

docker push registry.cn-qingdao.aliyuncs.com/wod/tmate:builder-alpine-3.10-amd64

# debian-mips64le
docker build \
  --build-arg BASE=registry.cn-qingdao.aliyuncs.com/wod/debian:bullseye-mips64le \
  --build-arg AUTHOR=mengkzhaoyun \
  --build-arg VERSION=builder-debian-bullseye \
  --build-arg TARGETARCH=mips64le \
  --tag registry.cn-qingdao.aliyuncs.com/wod/tmate:builder-debian-bullseye-mips64le \
  --file .beagle/builder/debian.dockerfile .beagle/builder/

docker push registry.cn-qingdao.aliyuncs.com/wod/tmate:builder-debian-bullseye-mips64le
```

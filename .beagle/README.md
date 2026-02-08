# tmate

https://github.com/tmate-io/tmate

```bash
git remote add upstream git@github.com:tmate-io/tmate.git

git fetch upstream

git merge upstream/master
```

## debug

```bash
# amd64
docker build \
  -f .beagle/dockerfile \
  --build-arg BASE=registry.cn-qingdao.aliyuncs.com/wod/alpine:3-amd64 \
  --no-cache \
  --target build \
  -t registry.cn-qingdao.aliyuncs.com/wod/tmate:2.4.1-amd64 \
  .

# arm64
docker build \
  -f .beagle/dockerfile \
  --build-arg BASE=registry.cn-qingdao.aliyuncs.com/wod/alpine:3-arm64 \
  --no-cache \
  --target build \
  -t registry.cn-qingdao.aliyuncs.com/wod/tmate:2.4.1-arm64 \
  .
```

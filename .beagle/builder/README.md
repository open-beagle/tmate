# debug

```bash
# docker build
docker run -it --rm \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $PWD/:/go/src/github.com/tmate-io/tmate \
-w /go/src/github.com/tmate-io/tmate \
-e CI_WORKSPACE=/go/src/github.com/tmate-io/tmate \
-e PLUGIN_BASE=registry.cn-qingdao.aliyuncs.com/wod/alpine:3.13 \
-e PLUGIN_DOCKERFILE=.beagle/builder/dockerfile \
-e PLUGIN_REPO=wod/tmate-builder \
-e PLUGIN_VERSION=alpine-3.13 \
-e PLUGIN_CHANNEL=amd64 \
-e PLUGIN_REGISTRY=registry.cn-qingdao.aliyuncs.com \
-e REGISTRY_USER=changeme \
-e REGISTRY_PASSWORD=changeme \
registry.cn-qingdao.aliyuncs.com/wod/devops-docker:1.0
```

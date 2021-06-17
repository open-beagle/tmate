# version

```bash
git remote add upstream git@github.com:tmate-io/tmate.git

git fetch upstream

git merge 2.4.0
```

## debug

```bash
docker run -it \
--rm \
--entrypoint bash \
-v $PWD/:/go/src/github.com/tmate-io/tmate \
-v /go/pkg:/go/pkg \
-w /go/src/github.com/tmate-io/tmate \
-e GOPROXY=https://goproxy.cn \
registry.cn-qingdao.aliyuncs.com/wod/golang:1.16.5-alpine \
.beagle/build.sh
```

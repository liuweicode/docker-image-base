# alpine with glibc 基础镜像

```
docker build -t tl-alpine:alpine-3.16-glibc-2.35-r0 -f Dockerfile .
docker images | grep alpine-3.16-glibc-2.35-r0
docker tag fb7c6bb9fc28 toplist-registry.cn-shanghai.cr.aliyuncs.com/88/tl-alpine:alpine-3.16-glibc-2.35-r0
docker push toplist-registry.cn-shanghai.cr.aliyuncs.com/88/tl-alpine:alpine-3.16-glibc-2.35-r0
```

#!/bin/bash

set -eux

docker build --no-cache -t tl-os:alpine-3.16-glibc-2.35-r0 -f Dockerfile .

docker images | grep 'alpine-3.16-glibc-2.35-r0'

IMAGETAG=$(docker images | grep 'alpine-3.16-glibc-2.35-r0' | head -n 1 | awk '{print $3}')

echo $IMAGETAG

docker tag $IMAGETAG toplist-registry.cn-shanghai.cr.aliyuncs.com/88/tl-os:alpine-3.16-glibc-2.35-r0

docker push toplist-registry.cn-shanghai.cr.aliyuncs.com/88/tl-os:alpine-3.16-glibc-2.35-r0

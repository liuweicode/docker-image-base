#!/bin/bash

set -eux

docker build --no-cache -t tl-os:alpine-3.16-base -f Dockerfile .

docker images | grep 'alpine-3.16-base'

IMAGETAG=$(docker images | grep 'alpine-3.16-base' | head -n 1 | awk '{print $3}')

echo $IMAGETAG

docker tag $IMAGETAG toplist-registry.cn-shanghai.cr.aliyuncs.com/88/tl-os:alpine-3.16-base

docker push toplist-registry.cn-shanghai.cr.aliyuncs.com/88/tl-os:alpine-3.16-base

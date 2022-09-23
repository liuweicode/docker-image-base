#!/bin/bash

set -eux

BUILD_NAME='tl-alpine'
BUILD_VERSION='alpine-3.16-glibc-2.35-r0'

docker build --no-cache -t $BUILD_NAME:$BUILD_VERSION -f Dockerfile .

docker images | grep $BUILD_VERSION

IMAGETAG=$(docker images | grep $BUILD_VERSION | head -n 1 | awk '{print $3}')

echo $IMAGETAG

docker tag $IMAGETAG toplist-registry.cn-shanghai.cr.aliyuncs.com/88/$BUILD_NAME:$BUILD_VERSION

docker push toplist-registry.cn-shanghai.cr.aliyuncs.com/88/$BUILD_NAME:$BUILD_VERSION

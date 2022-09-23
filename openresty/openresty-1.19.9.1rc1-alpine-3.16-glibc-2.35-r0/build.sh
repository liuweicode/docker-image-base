#!/bin/bash

set -eux

BUILD_NAME='openresty'
BUILD_VERSION='openresty-1.19.9.1rc1-alpine-3.16-glibc-2.35-r0'

docker build --no-cache -t $BUILD_NAME:$BUILD_VERSION -f Dockerfile .

docker images | grep $BUILD_VERSION

IMAGETAG=$(docker images | grep $BUILD_VERSION | head -n 1 | awk '{print $3}')

echo $IMAGETAG

docker tag $IMAGETAG suxz/$BUILD_NAME:$BUILD_VERSION

docker push suxz/$BUILD_NAME:$BUILD_VERSION

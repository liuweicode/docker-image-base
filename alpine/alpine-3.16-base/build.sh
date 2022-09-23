#!/bin/bash

set -eux

BUILD_NAME='alpine'
BUILD_VERSION='alpine-3.16-cn-base'

docker build --no-cache -t $BUILD_NAME:$BUILD_VERSION -f Dockerfile .

docker images | grep $BUILD_VERSION

IMAGETAG=$(docker images | grep $BUILD_VERSION | head -n 1 | awk '{print $3}')

echo $IMAGETAG

docker tag $IMAGETAG suxz/$BUILD_NAME:$BUILD_VERSION

docker push suxz/$BUILD_NAME:$BUILD_VERSION


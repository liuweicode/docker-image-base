#!/bin/bash

set -eux

BUILD_NAME='openjdk'
BUILD_VERSION='openjdk-8-jre-slim-bullseye-cn-base'

docker build --no-cache -t $BUILD_NAME:$BUILD_VERSION -f Dockerfile .

docker images | grep $BUILD_VERSION

IMAGETAG=$(docker images | grep $BUILD_VERSION | head -n 1 | awk '{print $3}')

echo $IMAGETAG

docker tag $IMAGETAG suxz/$BUILD_NAME:$BUILD_VERSION

docker push suxz/$BUILD_NAME:$BUILD_VERSION

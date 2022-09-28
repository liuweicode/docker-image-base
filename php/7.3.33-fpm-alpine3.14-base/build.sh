#!/bin/bash

set -eux

BUILD_NAME='php'
BUILD_VERSION='php-7.3.33-fpm-alpine3.14-base'

docker build --no-cache -t $BUILD_NAME:$BUILD_VERSION -f Dockerfile .

docker images | grep $BUILD_VERSION

IMAGETAG=$(docker images | grep $BUILD_VERSION | head -n 1 | awk '{print $3}')

echo $IMAGETAG

docker tag $IMAGETAG suxz/$BUILD_NAME:$BUILD_VERSION

docker push suxz/$BUILD_NAME:$BUILD_VERSION

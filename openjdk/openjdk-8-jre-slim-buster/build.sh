#!/bin/bash

set -eux

docker build --no-cache -t tl-java:openjdk-8-jre-slim-buster -f Dockerfile .

docker images | grep 'openjdk-8-jre-slim-buster'

IMAGETAG=$(docker images | grep 'openjdk-8-jre-slim-buster' | head -n 1 | awk '{print $3}')

echo $IMAGETAG

docker tag $IMAGETAG toplist-registry.cn-shanghai.cr.aliyuncs.com/88/tl-java:openjdk-8-jre-slim-buster

docker push toplist-registry.cn-shanghai.cr.aliyuncs.com/88/tl-java:openjdk-8-jre-slim-buster

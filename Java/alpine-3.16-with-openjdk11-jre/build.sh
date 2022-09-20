#!/bin/bash

set -eux

docker build --no-cache -t tl-jre:alpine-3.16-with-openjdk11-jre -f Dockerfile .

docker images | grep 'alpine-3.16-with-openjdk11-jre'

IMAGETAG=$(docker images | grep 'alpine-3.16-with-openjdk11-jre' | head -n 1 | awk '{print $3}')

echo $IMAGETAG

docker tag $IMAGETAG toplist-registry.cn-shanghai.cr.aliyuncs.com/88/tl-jre:alpine-3.16-with-openjdk11-jre

docker push toplist-registry.cn-shanghai.cr.aliyuncs.com/88/tl-jre:alpine-3.16-with-openjdk11-jre

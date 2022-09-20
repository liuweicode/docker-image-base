#!/bin/bash

set -eux

docker build --no-cache -t tl-os:centos7-base -f Dockerfile .

docker images | grep 'centos7-base'

IMAGETAG=$(docker images | grep 'centos7-base' | head -n 1 | awk '{print $3}')

echo $IMAGETAG

docker tag $IMAGETAG toplist-registry.cn-shanghai.cr.aliyuncs.com/88/tl-os:centos7-base

docker push toplist-registry.cn-shanghai.cr.aliyuncs.com/88/tl-os:centos7-base

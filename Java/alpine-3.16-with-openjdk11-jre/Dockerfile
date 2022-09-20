FROM toplist-registry.cn-shanghai.cr.aliyuncs.com/88/tl-os:alpine-3.16-base

RUN  apk update \
  && apk upgrade \
  && apk add --update openjdk11-jre \
  && rm -rf /var/cache/apk/*

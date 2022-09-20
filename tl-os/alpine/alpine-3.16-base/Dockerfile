FROM alpine:3.16

ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN:zh  
ENV LC_ALL zh_CN.UTF-8

RUN cd / ; \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories; \
    apk update; apk upgrade; \
    apk add --no-cache tzdata; \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; echo "Asia/Shanghai" > /etc/timezone; \
    apk del tzdata; \
    rm -rf /var/cache/apk/*

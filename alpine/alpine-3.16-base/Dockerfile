FROM alpine:3.16

# Default to UTF-8 file.encoding
ENV LANG='zh_CN.UTF-8' LANGUAGE='zh_CN:zh' LC_ALL='zh_CN.UTF-8'

RUN cd / ; \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories; \
    apk update; apk upgrade; \
    apk add --no-cache tzdata; \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; echo "Asia/Shanghai" > /etc/timezone; \
    apk del tzdata; \
    rm -rf /var/cache/apk/*

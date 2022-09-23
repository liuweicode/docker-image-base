# https://github.com/Docker-Hub-frolvlad/docker-alpine-glibc/blob/master/Dockerfile
# https://github.com/gliderlabs/docker-alpine/issues/144

FROM alpine:3.16


# Here we install GNU libc (aka glibc) and set zh_CN.UTF-8 locale as default.

ARG ALPINE_GLIBC_PACKAGE_VERSION="2.35-r0"
ARG ALPINE_GLIBC_BASE_PACKAGE_FILENAME="glibc-${ALPINE_GLIBC_PACKAGE_VERSION}.apk"
ARG ALPINE_GLIBC_BIN_PACKAGE_FILENAME="glibc-bin-${ALPINE_GLIBC_PACKAGE_VERSION}.apk"
ARG ALPINE_GLIBC_I18N_PACKAGE_FILENAME="glibc-i18n-${ALPINE_GLIBC_PACKAGE_VERSION}.apk"

RUN	set -eux; sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories ; \
    apk update ; \
    apk add --no-cache --virtual .build-deps ca-certificates wget tzdata; \
    wget --inet4-only -q -O /etc/apk/keys/sgerrand.rsa.pub https://static.toptastewin.com/docker/${ALPINE_GLIBC_PACKAGE_VERSION}/sgerrand.rsa.pub ; \
    wget --inet4-only https://static.toptastewin.com/docker/${ALPINE_GLIBC_PACKAGE_VERSION}/${ALPINE_GLIBC_BASE_PACKAGE_FILENAME} ; \
    wget --inet4-only https://static.toptastewin.com/docker/${ALPINE_GLIBC_PACKAGE_VERSION}/${ALPINE_GLIBC_BIN_PACKAGE_FILENAME} ; \
    wget --inet4-only https://static.toptastewin.com/docker/${ALPINE_GLIBC_PACKAGE_VERSION}/${ALPINE_GLIBC_I18N_PACKAGE_FILENAME} ; \
    apk add --no-cache \
        "$ALPINE_GLIBC_BASE_PACKAGE_FILENAME" \
        "$ALPINE_GLIBC_BIN_PACKAGE_FILENAME" \
        "$ALPINE_GLIBC_I18N_PACKAGE_FILENAME" ; \
    \
    (/usr/glibc-compat/bin/localedef --force --inputfile POSIX --charmap UTF-8 "zh_CN.UTF-8" || true) ; \
    echo "export LANG=zh_CN.UTF-8" > /etc/profile.d/locale.sh ; \
	\
	cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime ;\
    echo "Asia/Shanghai" > /etc/timezone ;\
    \
    apk del --purge .build-deps glibc-i18n tzdata ;\
    \
    rm -rf /var/cache/apk/* ; \
    \
    rm \
        "$ALPINE_GLIBC_BASE_PACKAGE_FILENAME" \
        "$ALPINE_GLIBC_BIN_PACKAGE_FILENAME" \
        "$ALPINE_GLIBC_I18N_PACKAGE_FILENAME"

# Default to UTF-8 file.encoding
ENV LANG='zh_CN.UTF-8' LANGUAGE='zh_CN:zh' LC_ALL='zh_CN.UTF-8'

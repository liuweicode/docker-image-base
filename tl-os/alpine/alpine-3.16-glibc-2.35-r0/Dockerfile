# https://github.com/Docker-Hub-frolvlad/docker-alpine-glibc/blob/master/Dockerfile
# https://github.com/gliderlabs/docker-alpine/issues/144

FROM alpine:3.16

ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN:zh  
ENV LC_ALL zh_CN.UTF-8

# Here we install GNU libc (aka glibc) and set zh_CN.UTF-8 locale as default.

ARG ALPINE_GLIBC_PACKAGE_VERSION="2.35-r0"
ARG ALPINE_GLIBC_BASE_PACKAGE_FILENAME="glibc-${ALPINE_GLIBC_PACKAGE_VERSION}.apk"
ARG ALPINE_GLIBC_BIN_PACKAGE_FILENAME="glibc-bin-${ALPINE_GLIBC_PACKAGE_VERSION}.apk"
ARG ALPINE_GLIBC_I18N_PACKAGE_FILENAME="glibc-i18n-${ALPINE_GLIBC_PACKAGE_VERSION}.apk"

RUN	sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories ; \
    apk update ; \
    apk --no-cache add ca-certificates wget ; \
    wget --inet4-only -q -O /etc/apk/keys/sgerrand.rsa.pub https://static.toptastewin.com/docker/${ALPINE_GLIBC_PACKAGE_VERSION}/sgerrand.rsa.pub ; \
    wget --inet4-only https://static.toptastewin.com/docker/${ALPINE_GLIBC_PACKAGE_VERSION}/${ALPINE_GLIBC_BASE_PACKAGE_FILENAME} ; \
    wget --inet4-only https://static.toptastewin.com/docker/${ALPINE_GLIBC_PACKAGE_VERSION}/${ALPINE_GLIBC_BIN_PACKAGE_FILENAME} ; \
    wget --inet4-only https://static.toptastewin.com/docker/${ALPINE_GLIBC_PACKAGE_VERSION}/${ALPINE_GLIBC_I18N_PACKAGE_FILENAME} ; \
    apk add --no-cache \
        "$ALPINE_GLIBC_BASE_PACKAGE_FILENAME" \
        "$ALPINE_GLIBC_BIN_PACKAGE_FILENAME" \
        "$ALPINE_GLIBC_I18N_PACKAGE_FILENAME" ; \
    \
    (/usr/glibc-compat/bin/localedef --force --inputfile POSIX --charmap UTF-8 "$LANG" || true) ; \
    echo "export LANG=$LANG" > /etc/profile.d/locale.sh ; \
    \
    apk del glibc-i18n ; \
    \
    apk del .build-dependencies ; \
    rm \
        "$ALPINE_GLIBC_BASE_PACKAGE_FILENAME" \
        "$ALPINE_GLIBC_BIN_PACKAGE_FILENAME" \
        "$ALPINE_GLIBC_I18N_PACKAGE_FILENAME"

# (Optional) Add extra packages for fontconfig and ttf-dejavu to support server-side image generation
RUN apk add --no-cache fontconfig libretls musl-locales musl-locales-lang ttf-dejavu tzdata zlib ; \
    rm -rf /var/cache/apk/* ; \
	cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime ;\
    echo "Asia/Shanghai" > /etc/timezone ;\


FROM php:7.3.33-fpm-alpine3.14

# Default to UTF-8 file.encoding
ENV LANG='zh_CN.UTF-8' LANGUAGE='zh_CN:zh' LC_ALL='zh_CN.UTF-8'

RUN cd / ; \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories; \
    apk update; apk upgrade; \
    apk add --no-cache tzdata; \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; echo "Asia/Shanghai" > /etc/timezone; \
    apk del tzdata; \
    rm -rf /var/cache/apk/*

COPY .vimrc /root

# Default extensions
# docker run --rm php:7.3.33-fpm php -m
# [PHP Modules]
# Core
# ctype
# curl
# date
# dom
# fileinfo
# filter
# ftp
# hash
# iconv
# json
# libxml
# mbstring
# mysqlnd
# openssl
# pcre
# PDO
# pdo_sqlite
# Phar
# posix
# readline
# Reflection
# session
# SimpleXML
# sodium
# SPL
# sqlite3
# standard
# tokenizer
# xml
# xmlreader
# xmlwriter
# zlib
# 
# [Zend Modules]


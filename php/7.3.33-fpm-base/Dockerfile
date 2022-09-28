FROM php:7.3.33-fpm

# https://dev.to/0xbf/set-timezone-in-your-docker-image-d22
# When your image is based on Debian, or your image's root is based on Debian, you can use ENV TZ in Dockerfile
ENV TZ=Asia/Shanghai

# 修改为中科大的源 https://mirrors.ustc.edu.cn/help/debian.html
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list ; \
    apt update ; \
    apt install -y locales ; \
    sed -i '/zh_CN.UTF-8/s/^# //g' /etc/locale.gen ; \
    locale-gen ; \
    apt clean && rm -rf /var/lib/{apt,dpkg,cache,log}/

# Default to UTF-8 file.encoding
ENV LANG='zh_CN.UTF-8' LANGUAGE='zh_CN:zh' LC_ALL='zh_CN.UTF-8'

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


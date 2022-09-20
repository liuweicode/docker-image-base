FROM centos:centos7

ENV LANG zh_CN.UTF-8  
ENV LANGUAGE zh_CN:zh  
ENV LC_ALL zh_CN.UTF-8  

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN set -eux;\
	sed -e 's|^mirrorlist=|#mirrorlist=|g' \
        -e 's|^#baseurl=http://mirror.centos.org/centos|baseurl=https://mirrors.ustc.edu.cn/centos|g' \
        -i.bak \
        /etc/yum.repos.d/CentOS-Base.repo

RUN sed -i '13'd /etc/yum.conf; \
    yum install -y kde-l10n-Chinese glibc-common; \
    localedef -c -f UTF-8 -i zh_CN zh_CN.utf8; \
    echo -e 'export LANG="zh_CN.UTF-8"\nexport LC_ALL="zh_CN.UTF-8"' > /etc/locale.conf; \
    source /etc/locale.conf; \
    yum clean all


COPY .vimrc /root

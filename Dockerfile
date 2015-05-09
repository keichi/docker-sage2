FROM centos:7
MAINTAINER Keichi Takahashi <keichi.t@me.com>

RUN \
    yum install -y epel-release && \
    yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && \
    yum install -y http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm && \
    yum install -y --enablerepo=remi ffmpeg ImageMagick-last nodejs unzip wget npm perl-Image-ExifTool openssl && \
    yum clean all && \
    wget https://bitbucket.org/sage2/sage2/downloads/sage2-2014-11-19-beta.zip && \
    unzip sage2-2014-11-19-beta.zip && \
    rm -f sage2-2014-11-19-beta.zip && \
    mv sage2-2014-11-19 sage && \
    cd sage2 && \
    npm install && \
    cd keys && \
    ./GO-linux && \
    cd .. \

EXPOSE 9292 9090
WORKDIR /sage2
CMD ["node", "server.js"]


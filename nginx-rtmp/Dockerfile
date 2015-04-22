FROM centos:latest
MAINTAINER Alin Jurj <office@perfectweb.ro>

USER root

RUN yum -y update
RUN yum install -y pcre-devel zlib-devel openssl-devel
RUN yum groupinstall 'Development Tools' -y
RUN mkdir -p /sources/nginx
RUN mkdir -p /sources/rtmp
RUN wget -O nginx.tar.gz https://github.com/nginx/nginx/archive/master.tar.gz
RUN wget -O rtmp.tar.gz https://github.com/arut/nginx-rtmp-module/archive/master.tar.gz
RUN tar -xzvf nginx.tar.gz -C /sources/nginx
RUN tar -xzvf rtmp.tar.gz -C /sources/rtmp
RUN ls -lrt /sources/rtmp/nginx-rtmp-module-master
RUN cd /sources/nginx/nginx-master && ./configure --add-module=/sources/rtmp/nginx-rtmp-module-master --with-http_ssl_module
RUN cd /sources/nginx/nginx-master && make && make install
RUN echo "daemon off;" >> /usr/local/nginx/conf/nginx.conf

ENV PATH /usr/local/nginx/sbin/:$PATH
ENV NGINX_HOME /usr/local/nginx/

WORKDIR /usr/local/nginx
EXPOSE 80 1935

CMD nginx -c /usr/local/nginx/conf/nginx.conf
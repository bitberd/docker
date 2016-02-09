FROM nginx
MAINTAINER Alin Jurj <office@perfectweb.ro>

ENV ISO http://cloud.centos.org/centos/7/atomic/images/CentOS-Atomic-Host-7-Installer.iso

RUN apt-get update
RUN apt-get install -y wget bsdtar
RUN wget -O /usr/share/nginx/html/image.iso $ISO
RUN bsdtar xfp /usr/share/nginx/html/image.iso
RUN sed -i.bak "s/location \/ {/location \/ { autoindex on;/g" /etc/nginx/conf.d/default.conf
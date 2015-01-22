FROM ubuntu:latest
MAINTAINER Alin Jurj <office@perfectweb.ro>

# set upsource build number and other variables
ENV BUILD 1.0.12566
ENV SOURCE /usr/local/upsource
ENV BIN ${SOURCE}/bin/upsource.sh
ENV PORT 1111

RUN apt-get -y update
RUN apt-get -y --force-yes dist-upgrade
RUN apt-get -y --force-yes install htop nano postfix openjdk-7-jdk unzip wget

WORKDIR /root
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Bucharest /etc/localtime

# ports
EXPOSE ${PORT}

RUN wget http://download.jetbrains.com/upsource/upsource-${BUILD}.zip
RUN unzip upsource-${BUILD}.zip
RUN rm -f upsource-${BUILD}.zip
RUN mv Upsource ${SOURCE}

RUN ${BIN} configure --listen-port ${PORT}

ENTRYPOINT ${BIN} start

# build
# docker build -t perfectweb/upsource .

# run
# docker run -dit -p 1111:1111 --name=source perfectweb/upsource
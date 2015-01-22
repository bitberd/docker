FROM ubuntu:latest
MAINTAINER Alin Jurj <office@perfectweb.ro>

# set upsource build number and other variables
ENV BUILD 1.0.12566
ENV SOURCE /usr/local/upsource
ENV BIN ${SOURCE}/bin/upsource.sh
ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk-amd64

RUN apt-get -y update
RUN apt-get -y --force-yes dist-upgrade
RUN apt-get -y --force-yes install openjdk-7-jdk unzip wget

WORKDIR /root
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Bucharest /etc/localtime

# ports
EXPOSE 1111

RUN export PATH=~/bin:$JAVA_HOME/bin:$PATH
RUN wget http://download.jetbrains.com/upsource/upsource-${BUILD}.zip
RUN unzip upsource-${BUILD}.zip
RUN rm -f upsource-${BUILD}.zip
RUN mv Upsource ${SOURCE}

RUN ${BIN} configure --listen-port 1111

ENTRYPOINT ${BIN} start

# clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# build
# docker build -t perfectweb/upsource .

# run
# docker run -dit -p 1111:1111 --name=source perfectweb/upsource
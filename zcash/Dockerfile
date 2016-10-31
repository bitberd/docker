FROM ubuntu:16.04
MAINTAINER Alin Jurj <office@perfectweb.ro>

USER root

ENV DEBIAN_FRONTEND noninteractive
ENV WALLET t1eiBzTHA6yjMT1gkpJw4Q4wMTGwqNHMeY3

RUN apt-get update -qq
RUN apt-get install -qqy qt5-default git make wget g++ cmake build-essential libboost-all-dev

RUN git clone https://github.com/nicehash/nheqminer.git
RUN cd /nheqminer/nheqminer; git checkout Linux ; mkdir build ; cd build ; cmake .. ; make

ENTRYPOINT /nheqminer/nheqminer/build/nheqminer -u $WALLET

# docker run -dit --name=zcash --net=host --restart=always perfectweb/zcash
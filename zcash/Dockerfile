FROM ubuntu:16.04
MAINTAINER Alin Jurj <office@perfectweb.ro>

USER root

ENV DEBIAN_FRONTEND noninteractive
ENV WALLET t1eiBzTHA6yjMT1gkpJw4Q4wMTGwqNHMeY3
ENV POOL eu1-zcash.flypool.org:3333

RUN apt-get update -qq
RUN apt-get install -qqy apt-transport-https qt5-default git make wget g++

RUN git clone https://github.com/etherchain-org/nheqminer.git
RUN cd /nheqminer; mkdir build ; cd build ; qmake ../nheqminer/nheqminer.pro ; make 

ENTRYPOINT ./nheqminer -l $POOL -u $WALLET.zcash

# docker run -dit --name=zcash --net=host --restart=always perfectweb/zcash

FROM ubuntu:latest
MAINTAINER Alin Jurj <office@perfectweb.ro>

USER root

ENV WALLET 45o3GNggqZcRuCRGYBLuM4LckUcFsv2TsPXJHAmtkTwrhKams736iicEu5dKvQSNZcDR3AGZqKicr8AsYLp4gNtPLENnh4H
ENV POOL stratum+tcp://xmr.crypto-pool.fr:7777

RUN	apt-get update -qq
RUN	apt-get install -qqy libcurl4-openssl-dev git make automake

RUN	git clone https://github.com/wolf9466/cpuminer-multi /cpuminer-multi

RUN	cd /cpuminer-multi; ./autogen.sh; ./configure; make

ENTRYPOINT /usr/bin/nice -n -10 /cpuminer-multi/minerd -a cryptonight -o $POOL -u $WALLET -p x

# docker run -dit --name=monero --net=host --pid=host perfectweb/monero

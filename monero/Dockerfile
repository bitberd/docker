FROM ubuntu:latest
MAINTAINER Alin Jurj <office@perfectweb.ro>

USER root

ENV WALLET a070354377dfa30301d42448f9eafd3b4aa01e1dcb087d92707b7b2055a4634b
ENV POOL stratum+tcp://xmr.crypto-pool.fr:7777

RUN apt-get update -qq
RUN apt-get install -qqy libcurl4-openssl-dev git make automake

RUN git clone https://github.com/wolf9466/cpuminer-multi /cpuminer-multi

RUN cd /cpuminer-multi; ./autogen.sh; ./configure; make

ENTRYPOINT sudo nice -n -10 /cpuminer-multi/minerd -a cryptonight -o $POOL -u $WALLET -p x

# docker run -dit --name=monero --net=host --pid=host --restart=always perfectweb/monero

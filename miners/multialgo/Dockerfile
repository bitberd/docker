FROM ubuntu:16.04

MAINTAINER Alin Jurj <office@perfectweb.ro>

USER root
WORKDIR /

RUN apt-get update -qq
RUN apt-get install -qqy libcurl4-openssl-dev git make automake gcc

RUN git clonehttps://github.com/tpruvot/ccminer.git
RUN cd /ccminer && ./build.sh

ENV WALLET 45o3GNggqZcRuCRGYBLuM4LckUcFsv2TsPXJHAmtkTwrhKams736iicEu5dKvQSNZcDR3AGZqKicr8AsYLp4gNtPLENnh4H
ENV PASSWORD x
ENV POOLHOSTNAME xmr.crypto-pool.fr
ENV PROTOCOL stratum+tcp
ENV PORT 7777
ENV THREADS 1
ENV RAWINTENSITY 670
ENV WORKSIZE 8

#RUN chmod +x /wolf-xmr-miner/entrypoint.sh

#WORKDIR /wolf-xmr-miner/

ENTRYPOINT ["bash"]
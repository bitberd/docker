FROM ubuntu:16.04

MAINTAINER Alin Jurj <office@perfectweb.ro>

USER root
WORKDIR /

RUN apt-get update -qq
RUN apt-get install -qqy libcurl4-openssl-dev git make automake gcc
RUN apt-get install -qqy ocl-icd-opencl-dev
RUN apt-get install -qqy libjansson-dev

RUN git clone https://github.com/wolf9466/wolf-xmr-miner.git
RUN cd /wolf-xmr-miner && make

ENV WALLET 45o3GNggqZcRuCRGYBLuM4LckUcFsv2TsPXJHAmtkTwrhKams736iicEu5dKvQSNZcDR3AGZqKicr8AsYLp4gNtPLENnh4H
ENV PASSWORD x
ENV POOLHOSTNAME xmr.crypto-pool.fr
ENV PROTOCOL stratum+tcp
ENV PORT 7777
ENV THREADS 1
ENV RAWINTENSITY 670
ENV WORKSIZE 8

COPY xmr.conf.tpl /wolf-xmr-miner/
COPY entrypoint.sh /wolf-xmr-miner/
RUN chmod +x /wolf-xmr-miner/entrypoint.sh

ENTRYPOINT ["/wolf-xmr-miner/entrypoint.sh"]
#ENTRYPOINT ["/wolf-xmr-miner/miner"]
#CMD ["-a cryptonight -o stratum+tcp://$POOL -u $WALLET -p x"]

# docker run -dit --name=monero-gpu --restart=always perfectweb/cryptonight:wolf

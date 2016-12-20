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
ENV POOL xmr.crypto-pool.fr:7777

ENTRYPOINT ["/wolf-xmr-miner/miner"]
CMD ["-a cryptonight -o stratum+tcp://$POOL -u $WALLET -p x"]

# docker run -dit --name=monero-gpu --restart=always perfectweb/cryptonight:wolf

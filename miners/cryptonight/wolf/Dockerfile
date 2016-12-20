FROM ubuntu:16.04

MAINTAINER Alin Jurj <office@perfectweb.ro>

USER root
WORKDIR /

ENV WALLET 45o3GNggqZcRuCRGYBLuM4LckUcFsv2TsPXJHAmtkTwrhKams736iicEu5dKvQSNZcDR3AGZqKicr8AsYLp4gNtPLENnh4H
ENV POOL xmr.crypto-pool.fr:7777

RUN apt-get update -qq
RUN apt-get install -qqy libcurl4-openssl-dev git make automake gcc ocl-icd-opencl-dev

RUN git clone https://github.com/wolf9466/wolf-xmr-miner.git
RUN cd /wolf-xmr-miner; ./configure; make

ENTRYPOINT ["/cpuminer-multi/minerd"]
CMD ["-a cryptonight -o stratum+tcp://$POOL -u $WALLET -p x"]

# docker run -dit --name=monero-gpu --restart=always perfectweb/cryptonight:cpumultiminer

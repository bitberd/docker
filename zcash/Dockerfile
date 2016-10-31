FROM nvidia/cuda
MAINTAINER Alin Jurj <office@perfectweb.ro>

USER root

ENV DEBIAN_FRONTEND noninteractive

#bitcoin wallet for nicehash
ENV WALLET 1Jf5TEWkkUNjLe8EBJxEKsiKmUcF3eG8sY

RUN apt-get update -qq
RUN apt-get install -qqy qt5-default git make wget g++ cmake build-essential libboost-all-dev

RUN git clone -b Linux https://github.com/nicehash/nheqminer.git
RUN cd nheqminer/cpu_xenoncat/Linux/asm/ && sh assemble.sh && cd ../../../Linux_cmake/nheqminer_cpu && cmake . && make

ENTRYPOINT /nheqminer/Linux_cmake/nheqminer_cpu/nheqminer_cpu -u $WALLET

# docker run -dit --name=zcash --net=host --restart=always perfectweb/zcash

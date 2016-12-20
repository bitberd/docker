FROM ubuntu:16.04

MAINTAINER Alin Jurj <office@perfectweb.ro>

USER root

ENV DEBIAN_FRONTEND noninteractive
ENV WALLET t1eiBzTHA6yjMT1gkpJw4Q4wMTGwqNHMeY3
ENV POOL eu1-zcash.flypool.org:3333

RUN apt-get update -qq
RUN apt-get install -qqy git build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python zlib1g-dev wget bsdmainutils automake opencl-headers mesa-common-dev

RUN git clone https://github.com/nginnever/zogminer.git
RUN cd cd zogminer/ && ./zcutil/fetch-params.sh && ./zcutil/build.sh -j$(nproc)

#ENTRYPOINT /nheqminer/Linux_cmake/nheqminer_cuda_tromp -l $POOL -u $WALLET.$(hostname)

# nvidia-docker run -dit --name=zcash --net=host --restart=always perfectweb/zcash

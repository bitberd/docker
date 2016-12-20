FROM ubuntu:16.04

MAINTAINER Alin Jurj <office@perfectweb.ro>

USER root
WORKDIR /

ENV DEBIAN_FRONTEND noninteractive
ENV WALLET t1eiBzTHA6yjMT1gkpJw4Q4wMTGwqNHMeY3
ENV POOL zec-eu1.nanopool.org:6666

RUN apt-get update -qq
RUN apt-get install -qqy git build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python zlib1g-dev wget bsdmainutils automake opencl-headers mesa-common-dev ocl-icd-opencl-dev vim-common

RUN git clone https://github.com/nginnever/zogminer.git
RUN cd zogminer/ && ./zcutil/fetch-params.sh && ./zcutil/build.sh -j$(nproc)

ENTRYPOINT ["/zogminer/src/zcash-miner"]
CMD ["-G -stratum='stratum+tcp://$POOL' -user=$WALLET -password=x"]

# docker run -dit --name=zcash --restart=always perfectweb/equihash:zogminer
FROM ubuntu:14.04

MAINTAINER Alin Jurj <office@perfectweb.ro>

WORKDIR /

RUN wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_7.5-18_amd64.deb \
    && sudo dpkg -i cuda-repo-ubuntu1404_7.5-18_amd64.deb \
    && rm -f cuda-repo-ubuntu1404_7.5-18_amd64.deb

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository -y ppa:ethereum/ethereum \
    && apt-get update \
    && apt-get install -y \
     git \
     cmake \
     libcryptopp-dev \
     libleveldb-dev \
     libjsoncpp-dev \
     libjson-rpc-cpp-dev \
     libboost-all-dev \
     libgmp-dev \
     libreadline-dev \
     libcurl4-gnutls-dev \
     ocl-icd-libopencl1 \
     opencl-headers \
     mesa-common-dev \
     libmicrohttpd-dev \
     build-essential \
     cuda

RUN git clone https://github.com/Genoil/cpp-ethereum/ \
    && cd cpp-ethereum \
    && mkdir build \
    && cd build \
    && cmake -DBUNDLE=cudaminer .. \
    && make -j8


ENV GPU_FORCE_64BIT_PTR=0
ENV GPU_MAX_HEAP_SIZE=100
ENV GPU_USE_SYNC_OBJECTS=1
ENV GPU_MAX_ALLOC_PERCENT=100
ENV GPU_SINGLE_ALLOC_PERCENT=100

ENTRYPOINT ["/cpp-ethereum/build/ethminer/ethminer", "--farm-recheck", "200", "-U" ]

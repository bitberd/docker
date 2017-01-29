FROM perfectweb/opencl:amd-gpu
MAINTAINER Alin Jurj <office@perfectweb.ro>

USER root
WORKDIR /

RUN apt-get update -qq
RUN apt-get install -qqy libcurl4-openssl-dev git make automake gcc
RUN apt-get install -qqy g++ libssl-dev
RUN apt-get install -qqy pkg-config libtool libncurses5-dev autoconf

RUN git clone https://github.com/lbryio/lbrycrd-gpu.git
RUN cd lbrycrd-gpu && git submodule init && git submodule update && autoreconf -i && CFLAGS="-O2 -Wall -std=gnu99" ./configure && make

RUN cd /ccminer && ./build.sh

ENTRYPOINT ["/ccminer/ccminer"]
CMD ["-a", "lbry", "-o", "stratum+tcp://lbry.suprnova.cc:6256", "-u", "Tahity.default", "-p", "x"]

FROM perfectweb/base:cuda-8.0-devel-ubuntu16.04
MAINTAINER Alin Jurj <office@perfectweb.ro>

USER root
WORKDIR /

RUN apt-get update -qq
RUN apt-get install -qqy libcurl4-openssl-dev git make automake gcc g++ libssl-dev libcurl4-openssl-dev

RUN git clone https://github.com/tpruvot/ccminer.git
RUN cd /ccminer && ./build.sh

ENTRYPOINT ["/ccminer/ccminer"]
CMD ["-a", "lbry", "-o", "stratum+tcp://lbry.suprnova.cc:6256", "-u", "Tahity.default", "-p", "x"]

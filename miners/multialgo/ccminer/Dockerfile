FROM perfectweb/ethash:genoil
MAINTAINER Alin Jurj <office@perfectweb.ro>

USER root
WORKDIR /

RUN apt-get update -qq
RUN apt-get install -qqy libcurl4-openssl-dev git make automake gcc
RUN apt-get install -qqy g++ libssl-dev

RUN git clone https://github.com/tpruvot/ccminer.git
RUN cd /ccminer && ./build.sh

LABEL com.nvidia.volumes.needed="nvidia_driver"
LABEL com.nvidia.cuda.version="8.0"

ENTRYPOINT ["/ccminer/ccminer"]
CMD ["-a", "lbry", "-o", "stratum+tcp://lbry.suprnova.cc:6256", "-u", "Tahity.default", "-p", "x"]

# @todo remove genoil as dependecy when cuda on ubuntu 16.04 is released

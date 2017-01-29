FROM ubuntu:16.04
MAINTAINER Alin Jurj <office@perfectweb.ro>

USER root
WORKDIR /

RUN apt-get update -qq
#RUN apt-get install -qqy libcurl4-openssl-dev git make automake gcc
#RUN apt-get install -qqy g++ libssl-dev
#RUN apt-get install -qqy pkg-config libtool libncurses5-dev autoconf
RUN apt-get install -qqy libcurl4-openssl-dev pkg-config libtool libcurl3-gnutls

ADD lbrycrd-gpu /lbrycrd-gpu

ENTRYPOINT ["/lbrycrd-gpu/sgminer"]
CMD ["-k", "lbry", "-o", "stratum+tcp://lbry.suprnova.cc:6256", "-u", "Tahity.default", "-p", "x", "-T"]

# https://github.com/lbryio/lbrycrd-gpu
# ./sgminer -o stratum+tcp://lbry.suprnova.cc:6256 -u Tahity.default -p x -k lbry -d 0
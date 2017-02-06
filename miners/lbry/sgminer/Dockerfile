FROM perfectweb/base:base-v1
MAINTAINER Alin Jurj <office@perfectweb.ro>

RUN apt-get update -qq
RUN apt-get install -qqy libcurl4-openssl-dev pkg-config libtool libcurl3-gnutls

ADD lbrycrd-gpu /lbrycrd-gpu

ENTRYPOINT ["/lbrycrd-gpu/sgminer"]
CMD ["-k", "lbry", "-o", "stratum+tcp://lbry.suprnova.cc:6256", "-u", "Tahity.default", "-p", "x", "-T"]

# https://github.com/lbryio/lbrycrd-gpu
# ./sgminer -o stratum+tcp://lbry.suprnova.cc:6256 -u Tahity.default -p x -k lbry -d 0

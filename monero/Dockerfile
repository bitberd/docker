# ex: docker run perfectweb/cpuminer --url stratum+tcp://ltc.pool.com:80 --user creack.worker1 --pass abcdef

FROM		ubuntu:latest
MAINTAINER	Alin Jurj <office@perfectweb.ro>

ENV WALLET 45o3GNggqZcRuCRGYBLuM4LckUcFsv2TsPXJHAmtkTwrhKams736iicEu5dKvQSNZcDR3AGZqKicr8AsYLp4gNtPLENnh4H
ENV POOL stratum+tcp://xmr.crypto-pool.fr:3333

RUN		apt-get update -qq

RUN		apt-get install -qqy automake
RUN		apt-get install -qqy libcurl4-openssl-dev
RUN		apt-get install -qqy git
RUN		apt-get install -qqy make

RUN		git clone https://github.com/wolf9466/cpuminer-multi

RUN		cd cpuminer && ./autogen.sh
RUN		cd cpuminer && ./configure
RUN		cd cpuminer && make

WORKDIR		/cpuminer
ENTRYPOINT	["./minerd -a cryptonight -o $POOL  -u $WALLET -p x"]

FROM ubuntu:16.04
MAINTAINER Alin Jurj <office@perfectweb.ro>

USER root

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq
RUN apt-get install -qqy apt-transport-https git make wget g++
RUN echo "deb https://apt.z.cash/ jessie main" | tee /etc/apt/sources.list.d/zcash.list
RUN apt-get update -qq
RUN wget -qO - https://apt.z.cash/zcash.asc | apt-key add -
RUN apt-get install -qqy --allow-unauthenticated zcash

RUN mkdir -p ~/.zcash ; echo "addnode=mainnet.z.cash" >~/.zcash/zcash.conf ; echo "rpcuser=perfectzcash" >>~/.zcash/zcash.conf ; echo "rpcpassword=`head -c 32 /dev/urandom | base64`" >>~/.zcash/zcash.conf ; echo 'gen=1' >> ~/.zcash/zcash.conf ; echo 'equihashsolver=tromp' >> ~/.zcash/zcash.conf
RUN zcash-fetch-params


ENTRYPOINT zcashd

# docker run -dit -v /root/.zcash:/root/.zcash --name=zcash_node --net=host --restart=always perfectweb/zcash:node
FROM ubuntu:latest
MAINTAINER Alin Jurj <office@perfectweb.ro>

USER root

ENV WALLET t1eiBzTHA6yjMT1gkpJw4Q4wMTGwqNHMeY3
ENV POOL eu1-zcash.flypool.org:3333

RUN mkdir -p ~/.zcash ; echo "addnode=mainnet.z.cash" >~/.zcash/zcash.conf ; echo "rpcuser=perfectzcash" >>~/.zcash/zcash.conf ; echo "rpcpassword=`head -c 32 /dev/urandom | base64`" >>~/.zcash/zcash.conf ; echo 'gen=1' >> ~/.zcash/zcash.conf 
RUN echo "genproclimit=$(nproc)" >> ~/.zcash/zcash.conf ; echo 'equihashsolver=tromp' >> ~/.zcash/zcash.conf ; echo 'equihashsolver=tromp' >> ~/.zcash/zcash.conf

RUN wget -qO - https://apt.z.cash/zcash.asc | sudo apt-key add -
RUN echo "deb https://apt.z.cash/ jessie main" | sudo tee /etc/apt/sources.list.d/zcash.list

RUN apt-get update -qq
RUN apt-get install -qqy apt-transport-https zcash qt5-default git make

RUN git clone https://github.com/etherchain-org/nheqminer.git
RUN cd /nheqminer; mkdir build ; cd build ; qmake ../nheqminer/nheqminer.pro ; make

ENTRYPOINT zcashd -daemon ; ./nheqminer -l $POOL -u $WALLET.zcash

# docker run -dit --name=zcash --net=host --restart=always perfectweb/zcash

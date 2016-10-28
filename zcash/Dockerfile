FROM ubuntu:latest
MAINTAINER Alin Jurj <office@perfectweb.ro>

USER root

RUN mkdir -p ~/.zcash ; echo "addnode=mainnet.z.cash" >~/.zcash/zcash.conf ; echo "rpcuser=perfectzcash" >>~/.zcash/zcash.conf ; echo "rpcpassword=`head -c 32 /dev/urandom | base64`" >>~/.zcash/zcash.conf ; echo 'gen=1' >> ~/.zcash/zcash.conf 
RUN echo "genproclimit=$(nproc)" >> ~/.zcash/zcash.conf ; echo 'equihashsolver=tromp' >> ~/.zcash/zcash.conf ; echo 'equihashsolver=tromp' >> ~/.zcash/zcash.conf

RUN wget -qO - https://apt.z.cash/zcash.asc | sudo apt-key add -
RUN echo "deb https://apt.z.cash/ jessie main" | sudo tee /etc/apt/sources.list.d/zcash.list

RUN apt-get update -qq
RUN apt-get install -qqy apt-transport-https zcash

ENTRYPOINT zcashd

# docker run -dit --name=zcash --net=host --restart=always perfectweb/zcash

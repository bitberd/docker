FROM ubuntu:16.04

MAINTAINER Alin Jurj <office@perfectweb.ro>

USER root
WORKDIR /

COPY miner /

ENV WALLET t1eiBzTHA6yjMT1gkpJw4Q4wMTGwqNHMeY3
ENV POOL_HOSTNAME zec-eu1.nanopool.org
ENV POOL_PORT 6666

RUN chmod 0777 /miner

ENTRYPOINT ["/miner"]
CMD ["--server $POOL_HOSTNAME --user $WALLET.default --pass z --port $POOL_PORT"]

# docker run -dit --name=zcash-cuda --restart=always perfectweb/equihash:ewbf
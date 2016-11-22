FROM ubuntu:16.04
MAINTAINER Alin Jurj <office@perfectweb.ro>

ENV DEBIAN_FRONTEND noninteractive

ENV GPU_FORCE_64BIT_PTR=1
ENV GPU_MAX_HEAP_SIZE=100
ENV GPU_USE_SYNC_OBJECTS=1
ENV GPU_MAX_ALLOC_PERCENT=100
ENV GPU_SINGLE_ALLOC_PERCENT=100

RUN apt-get update && apt-get install -y curl libcurlpp-dev

COPY . /claymore

ENTRYPOINT  ["/claymore/ethdcrminer64"]
CMD ["-epool", "closest.eth.perfectmine.io:8008", "-ewal", "0xba3fe7560d11d0164ec79a782e6f606d677779fb", "-epsw", "x", "-allpools", "1", "-allcoins", "1", "-dpsw", "x", "-dwal", "480b19a1fee9a1c0579cc4438c5fd54785994f2fea989141d2aa99dc172ff52dcb55c44ea88d/dual", "-dpool", "stratum+tcp://sia-eu1.nanopool.org:7777", "-dcoin", "sia", "-eworker", "dual", "-dbg", "-1", "-tt", "1", "-ttdcr", "80", "-tstop", "95", "-etha", "2"]

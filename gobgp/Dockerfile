# gobgp (part of Ryu SDN Framework)
#

FROM golang:1.3

MAINTAINER FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>

RUN apt-get update
RUN apt-get install -qy --no-install-recommends unzip wget

ENV HOME /root
WORKDIR /root

RUN go get github.com/osrg/gobgp
RUN wget --no-check-certificate https://github.com/osrg/gobgp/archive/master.zip
RUN unzip master.zip
RUN cd gobgp-master && go build bmpd.go && cp bmpd /usr/sbin

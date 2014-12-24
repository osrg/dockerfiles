# gobgp (part of Ryu SDN Framework)
#

FROM golang:1.3

MAINTAINER FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>

RUN apt-get update
RUN apt-get install -qy --no-install-recommends wget lv tcpdump emacs23-nox

ENV HOME /root
WORKDIR /root

RUN go get github.com/osrg/gobgp
RUN ln -s /go/srcgithub.com/osrg/gobgp .

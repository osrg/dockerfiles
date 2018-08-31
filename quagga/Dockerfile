# Quagga BGP
#
# VERSION 0.0.1

FROM golang:1.8-jessie

MAINTAINER FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>

RUN apt-get update
RUN apt-get install -qy --no-install-recommends supervisor quagga telnet tcpdump

RUN sed -i 's/bgpd=no/bgpd=yes/g' /etc/quagga/daemons
RUN sed -i 's/zebra=no/zebra=yes/g' /etc/quagga/daemons

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord"]

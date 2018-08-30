# Quagga BGP

FROM golang:1.10-stretch

MAINTAINER FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>

RUN apt-get update && apt-get install -qy --no-install-recommends \
    supervisor \
    quagga \
    telnet \
    tcpdump \
 && rm -rf /var/lib/apt/lists/* \
# Prepare state files directories
 && mkdir /var/run/quagga && chown quagga:quagga /var/run/quagga \
 && mkdir /var/log/quagga && chown quagga:quagga /var/log/quagga \
# For the backward compatibility
 && ln -s /usr/sbin/zebra /usr/local/sbin/zebra \
 && ln -s /usr/sbin/ospfd /usr/local/sbin/ospfd \
 && ln -s /usr/sbin/bgpd  /usr/local/sbin/bgpd

ADD supervisord.conf /etc/supervisor/conf.d/quagga.conf
ADD zebra.conf /etc/quagga/zebra.conf

ENTRYPOINT ["/usr/bin/supervisord"]

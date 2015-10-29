# Ryu SDN Framework
#
# VERSION 0.0.1

FROM ubuntu:15.04

MAINTAINER FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>

RUN apt-get update && apt-get install -y --no-install-recommends \
                        python-setuptools \
                        python-pip \
                        python-eventlet \
                        python-lxml \
                        python-msgpack \
                        unzip \
                        wget \
                   && rm -rf /var/lib/apt/lists/*

ENV HOME /root
WORKDIR /root

RUN wget --no-check-certificate https://github.com/osrg/ryu/archive/master.zip
RUN unzip master.zip && \
    cd ryu-master && \
    pip install -r tools/pip-requires && \
    python setup.py install

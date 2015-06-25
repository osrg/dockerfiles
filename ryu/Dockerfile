# Ryu SDN Framework
#
# VERSION 0.0.1

FROM ubuntu:15.04

MAINTAINER FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>

RUN apt-get update
RUN apt-get install -qy --no-install-recommends python-setuptools python-pip python-eventlet python-lxml python-msgpack unzip wget

ENV HOME /root
WORKDIR /root

RUN wget --no-check-certificate https://github.com/osrg/ryu/archive/master.zip
RUN unzip master.zip
RUN cd ryu-master && python setup.py install

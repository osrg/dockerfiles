# EXA BGP
#
# Commit version to be use [ bb7d1b7b539a48ca331c05a474f1af6015424273 ]

FROM ubuntu:14.04

MAINTAINER Naoto Hanaue <hanaue.naoto@po.ntts.co.jp>

RUN apt-get update
RUN apt-get install -qy --no-install-recommends wget python git

ENV HOME /root
WORKDIR /root

RUN git config --global http.sslVerify false
RUN git clone http://github.com/Exa-Networks/exabgp.git
RUN cd exabgp; git reset --hard bb7d1b7b539a48ca331c05a474f1af6015424273

ADD exabgp.env /root/exabgp/etc/exabgp/exabgp.env

FROM akihirosuda/dind-ovs-superpack
MAINTAINER Akihiro Suda <suda.akihiro@lab.ntt.co.jp>

# Earthquake v0.1 (Jun 10, 2015)
ENV EARTHQUAKE_GIT_COMMIT v0.1

# This env is for dind
ENV LOG file

# Install deps
RUN apt-get update && apt-get install -y python-flask python-scapy python-zmq sudo
RUN pip install zktraffic==0.1.3 hexdump

# Install Earthquake
WORKDIR /
RUN git clone https://github.com/osrg/earthquake.git && \
  ( cd earthquake && \
    git checkout ${EARTHQUAKE_GIT_COMMIT} && \
    git submodule init && \
    git submodule update )
WORKDIR /earthquake/example/zk-found-bug.ether    

# Install init
ADD ./banner.txt /banner.txt
ADD ./init.earthquake-zookeeper.sh /init.earthquake-zookeeper.sh
RUN chmod +x /init.earthquake-zookeeper.sh
CMD ["wrapdocker", "/init.dind-ovs-ryu-pipework-superpack.sh", "/init.earthquake-zookeeper.sh"]

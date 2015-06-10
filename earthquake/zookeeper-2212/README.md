# Earthquake Demo for ZOOKEEPER-2212 (distributed race condition related to QV version)

[Earthquake](http://osrg.github.io/earthquake/) is a dynamic model checker (DMCK) for real implementations of distributed system (such as ZooKeeper).

Earthquakes permutes C/Java function calls, Ethernet packets, and injected fault events in various orders so as to find implementation-level bugs of the distributed system.

We have successfully found a distributed race condition bug (will be ZOOKEEPER-2212) of ZooKeeper using Earthquake.
This container can reproduce the bug we found.

For further information, please refer to https://github.com/osrg/earthquake/tree/v0.1/example/zk-found-bug.ether


## Usage

    
    host$ sudo modprobe openvswitch
    host$ docker run --privileged -t -i --rm osrg/earthquake-zookeeper-2212
    guest$ ./000-prepare.sh
    [INFO] Starting Earthquake Ethernet Switch
    [INFO] Starting Earthquake Orchestrator
    [INFO] Starting Earthquake Ethernet Inspector
    [IMPORTANT] Please kill the processes (switch=1234, orchestrator=1235, and inspector=1236) after you finished all of the experiments
    [IMPORTANT] Please continue to 100-run-experiment.sh..
    guest$ ./100-run-experiment.sh
    [IMPORTANT] THE BUG WAS REPRODUCED!
    guest$ kill -9 1234 1235 1236
    

## Environment Variables
 * `DISABLE_EQ`: disable Earthquake

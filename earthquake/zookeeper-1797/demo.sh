#!/bin/bash
# earthquake demo for reproduction of ZOOKEEPER-1797 ("PurgeTxnLog may delete data logs during roll")

function INFO(){
    echo -e "\e[104m\e[97m[INFO]\e[49m\e[39m $@"
}

function IMPORTANT(){
    echo -e "\e[105m\e[97m[IMPORTANT]\e[49m\e[39m $@"
}

INFO "Reproducing ZOOKEEPER-1797 (PurgeTxnLog may delete data logs during roll)"

INFO "Cleaning.."
rm -rf /tmp/* /*.out /*.log

INFO "Starting earthquake (${EARTHQUAKE_GIT_COMMIT})"
earthquake/earthquake/earthquake --launch-orchestrator --daemonize --log-file-path=earthquake.log --execution-file-path=zookeeper/earthquake/zookeeper-1797/1797.json

INFO "Starting ZooKeeper  (${ZOOKEEPER_GIT_COMMIT})"
zookeeper/bin/zkServer.sh start > /zkServer.log 2>&1

INFO "Starting createZnode.sh (see /createZnode.log)"
sh zookeeper/earthquake/zookeeper-1797/createZnode.sh > /createZnode.log 2>&1
sleep 3

INFO "Restarting ZooKeeper"
zookeeper/bin/zkServer.sh stop >> /zkServer.log 2>&1
sleep 3
zookeeper/bin/zkServer.sh start >> /zkServer.log 2>&1
sleep 3

INFO "Checking Znodes (see /validateZnode.log)"
sh zookeeper/earthquake/zookeeper-1797/validateZnode.sh > /validateZnode.log 2>&1

INFO "Done"
if grep "Unexpected exception when visiting znode" /validateZnode.log; then
    IMPORTANT "SUCCESS: earthquake reproduced the bug."
else
    IMPORTANT "FAIL: earthquake could not reproduce the bug."
    IMPORTANT "earthquake cannot always reproduce the bug due to non-determinism."
    IMPORTANT "You can probably reproduce the bug by trying to run this container several times."
fi
INFO "For more information, please refer to https://github.com/osrg/earthquake and https://github.com/osrg/zookeeper/blob/zookeeper-1797/earthquake/zookeeper-1797/README.txt"

INFO "Exiting.."
INFO 'If you want to drop to shell after the test, please run `docker run -i -t osrg/earthquake-zookeeper-1797 /bin/bash`, then run `/init.py` in the container'.

# Earthquake Demo for ZOOKEEPER-1797

This container reproduces the bug reported in [ZOOKEEPER-1797](https://issues.apache.org/jira/browse/ZOOKEEPER-1797) ("PurgeTxnLog may delete data logs during roll") using [earthquake](https://github.com/osrg/earthquake).

## Example

    $ docker run -i -t --rm osrg/earthquake-zookeeper-1797
    [INFO] Reproducing ZOOKEEPER-1797 (PurgeTxnLog may delete data logs during roll)
    [INFO] Cleaning..
    [INFO] Starting earthquake (ca91befb0556bddbf8229ef9b6650ec94cf79471)
    [INFO] Starting ZooKeeper  (4d08af6da87eac3b565d599b0d24683e2e734827)
    [INFO] Starting createZnode.sh (see /createZnode.log)
    [INFO] Restarting ZooKeeper
    [INFO] Checking Znodes (see /validateZnode.log)
    [INFO] Done
    Unexpected exception when visiting znode!: error_count=5
    [IMPORTANT] SUCCESS: earthquake reproduced the bug.
    [INFO] For more information, please refer to https://github.com/osrg/earthquake and https://github.com/osrg/zookeeper/blob/zookeeper-1797/earthquake/zookeeper-1797/README.txt
    [INFO] Exiting..
    [INFO] If you want to drop to shell after the test, please run `docker run -i -t osrg/earthquake-zookeeper-1797 /bin/bash`, then run `/init.py` in the container.
    

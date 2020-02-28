#!/usr/bin/env bash

# start the ssh server
/etc/init.d/ssh start

# start the hadoop server
hdfs namenode -format
start-dfs.sh

# start the hbase server
start-hbase.sh

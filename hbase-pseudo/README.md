Apache HBase
============

https://hbase.apache.org/

Apache HBase NoSQL columnar datastore

Starts a single pseudo-distributed HBase cluster based on local install of HDFS
```
docker run -p 16010:16010 -p 16030:16030 --hostname sakthi-docker -it jatsakthi/hbase_docker:pseudo bash
```

1. How to Build?
```
docker build -t "hbase_docker:tag" .

# To push to Docker Hub
docker tag hbase_docker:pseudo jatsakthi/hbase_docker:pseudo
git push jatsakthi/hbase_docker:pseudo
```

2. How to Run?
Add the following to /etc/hosts of the Docker host:
```
127.0.0.1       sakthi-docker
```
And then,
```
docker run -p 16010:16010 -p 16030:16030 --hostname sakthi-docker -it hbase_docker:pseudo bash
root@sakthi-docker:~# ./startup.sh
root@sakthi-docker:~# jps # To see the running java processes
root@sakthi-docker:~# stop-hbase.sh # To stop HBase
root@sakthi-docker:~# hdfs dfs -ls / # To check hdfs directory
```
And access HBase from localhost:16010. You can change the ports as per your requirements.

The HBase root dir: `hdfs://localhost:9000/hbase`
The Zookeeper root dir: `/root/zookeeper`

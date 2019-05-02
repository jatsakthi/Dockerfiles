
FROM ubuntu:16.04

# Set the work directory
WORKDIR /root

# Install dependencies
RUN apt-get update && \
    apt-get -y install wget && \
    apt-get -y install vim && \
    apt-get -y install ssh && \
    apt-get install -y iputils-ping && \
    apt-get install -y openssh-server 

# Start SSH
RUN apt-get install -y openssh-server && \
    /etc/init.d/ssh start

# Setup Password less ssh to localhost
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
    chmod 0600 ~/.ssh/authorized_keys

# Install Java.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install default-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

# Add Java to the path.
ENV PATH /usr/lib/jvm/java-8-openjdk-amd64/bin:$PATH

# Copy jars and other files
ADD data/* /root/

# Hadoop
RUN cp -t /root/hadoop-3.0.2/etc/hadoop/ core-site.xml hadoop-env.sh hdfs-site.xml

# HBase
RUN cp -t /root/hbase-3.0.0-SNAPSHOT/conf/ hbase-site.xml hbase-env.sh

# Add Hadoop and HBase bin dirs to the path
ENV PATH /root/hadoop-3.0.2/sbin:$PATH
ENV PATH /root/hbase-3.0.0-SNAPSHOT/bin:$PATH

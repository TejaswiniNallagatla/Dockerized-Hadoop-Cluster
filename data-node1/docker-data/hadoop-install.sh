#!/bin/bash

if [ "$1" = "slave" ]; then
	cd /etc
	apt-get update
	apt-get update && apt-get install -y openssh-server apache2 supervisor
	apt-get install -y vim gettext-base default-jre default-jdk wget telnet supervisor
	wget http://mirrors.advancedhosters.com/apache/hadoop/common/hadoop-2.8.1/hadoop-2.8.1.tar.gz
	tar -xzvf hadoop-2.8.1.tar.gz
    mv hadoop-2.8.1/ hadoop/
    mkdir /etc/hadoop/hdfstmp
    chown -R root:root /etc/hadoop/  
else
    exec "$@"
fi

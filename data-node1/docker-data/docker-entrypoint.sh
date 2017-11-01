#!/bin/bash

envsubst < /etc/hadoop-files/core-site.tmpl > /etc/hadoop/etc/hadoop/core-site.xml
envsubst < /etc/hadoop-files/hdfs-site.tmpl > /etc/hadoop/etc/hadoop/hdfs-site.xml
envsubst < /etc/hadoop-files/mapred-site.tmpl > /etc/hadoop/etc/hadoop/mapred-site.xml
envsubst < /etc/hadoop-files/masters.tmpl > /etc/hadoop/etc/hadoop/masters
envsubst < /etc/hadoop-files/slaves.tmpl > /etc/hadoop/etc/hadoop/slaves

echo 'Y'|/etc/hadoop/bin/hadoop namenode -format
#process runs in background
nohup hadoop namenode &
#on restarting a a docker conatiner the application gets executed
supervisord -c /etc/supervisor/conf.d/supervisord.conf
sleep 3
tail -50f /var/log/supervisor/master*.log

/bin/bash
# Dockerfile for a Redis container on CoreOS.
FROM shift/coreos-ubuntu-confd:latest
MAINTAINER Mind Stream <mindstream@mindstream.org>

# Some Environment Variables
ENV DEBIAN_FRONTEND non-interactive

##Add Hadoop bin/ directory to PATH
ENV PATH=$PATH:/etc/hadoop/bin

##Set Hadoop-related environment variables
ENV HADOOP_HOME=/etc/hadoop
ENV HADOOP_CONF_DIR=/etc/hadoop/etc/hadoop
ENV HADOOP_MAPRED_HOME=/etc/hadoop
ENV HADOOP_COMMON_HOME=/etc/hadoop
ENV HADOOP_HDFS_HOME=/etc/hadoop
ENV YARN_HOME=/etc/hadoop

##Set JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre
ENV PATH=$PATH:$JAVA_HOME/bin

RUN mkdir /etc/hadoop-files
RUN chmod 644 /etc/hadoop-files

COPY ./docker-data/core-site.tmpl /etc/hadoop-files/core-site.tmpl
RUN chmod 644 /etc/hadoop-files/core-site.tmpl

COPY ./docker-data/hdfs-site.tmpl /etc/hadoop-files/hdfs-site.tmpl
RUN chmod 644 /etc/hadoop-files/hdfs-site.tmpl

COPY ./docker-data/mapred-site.tmpl /etc/hadoop-files/mapred-site.tmpl
RUN chmod 644 /etc/hadoop-files/mapred-site.tmpl

COPY ./docker-data/masters.tmpl /etc/hadoop-files/masters.tmpl
RUN chmod 644 /etc/hadoop-files/masters.tmpl

COPY ./docker-data/slaves.tmpl /etc/hadoop-files/slaves.tmpl
RUN chmod 644 /etc/hadoop-files/slaves.tmpl

COPY ./docker-data/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chmod 755 /etc/supervisor/conf.d/supervisord.conf

COPY ./docker-data/hadoop-install.sh /hadoop-install.sh
RUN chmod 755 /hadoop-install.sh

COPY ./docker-data/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 755 /docker-entrypoint.sh

RUN /bin/bash /hadoop-install.sh slave

# Expose port
EXPOSE 8020 8021

# Entrypoint Script and Argument
CMD /docker-entrypoint.sh
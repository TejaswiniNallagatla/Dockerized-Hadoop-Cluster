# Dockerized-Hadoop-Cluster
Setting up a hadoop multi-node clusters in a docker container

##Commands##
docker build -t="nn:1.0" .
docker images

to start conatiner
docker run -itd --name="snn-1" -e MASTER='ec2-52-36-97-111.us-west-2.compute.amazonaws.com' -e MASTER_PORT='8020' -e DFS_REP='1' -e MAPRED_PORT='8021' nn:1.0
docker ps -a
login to the conatiner
docker exec -it nn-1 /bin/bash

##docker login##
username:
password:

docker pull mindstreamorg/nn:1.0
docker push mindstreamorg/nn:1.0

ps -ef -- list of all processes rununning 

netstat--  port of the process running
 netstat -na|grep 8020

Master
sudo docker run -itd --name="master3" -e MASTER='ec2-35-162-96-38.us-west-2.compute.amazonaws.com' -e SNN='ec2-52-33-60-135.us-west-2.compute.amazonaws.com' -e DN1='ec2-50-112-34-197.us-west-2.compute.amazonaws.com' -e DN2='ec2-34-209-166-44.us-west-2.compute.amazonaws.com' -e MASTER_PORT='8020' -e DFS_REP='1' -e MAPRED_PORT='8021' mymaster1:1.0

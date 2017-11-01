##Commands##
docker build -t="nn:1.0" .
docker images

docker run -itd --name="nn-1" -e MASTER='localhost' -e MASTER_PORT='8020' -e DFS_REP='1' -e MAPRED_PORT='8021' nn:1.0
docker ps -a

docker exec -it nn-1 /bin/bash

##docker login##
username:
password:

docker pull mindstreamorg/nn:1.0
docker push mindstreamorg/nn:1.0
#/bin/bash

docker images -a | grep "localhost" | awk '{print $3}' |  xargs docker rmi -f

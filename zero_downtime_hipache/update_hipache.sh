#!/bin/bash

ip=`docker inspect  --format '{{.NetworkSettings.IPAddress}}' $1`
docker run --rm --link /hipache:redis vieux/redis-cli lset frontend:$2 -1 http://$ip:$3

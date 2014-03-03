#!/bin/bash

ip=`docker inspect  --format '{{.NetworkSettings.IPAddress}}' $1`
docker run --rm --link /hipache:redis vieux/redis-cli rpush frontend:$2 $4
docker run --rm --link /hipache:redis vieux/redis-cli rpush frontend:$2 http://$ip:$3

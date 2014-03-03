#!/bin/bash

#launch hipache
docker run -d --name /hipache --expose 6379 -p 80:80 hipache
sleep 1 

#launch redis commander linked to redis server
id_redis_comm=`docker run -d --name /redis-commander --expose 8081 --link /hipache:redis vieux/redis-commander`

#launch registry
id_registry=`docker run -d --name /registry --expose 5000 library/registry`

#update hipache configuration
./set_hipache.sh $id_redis_comm redis.vieux.fr 8081 redis_comm
./set_hipache.sh $id_registry registry.vieux.fr 5000 registry


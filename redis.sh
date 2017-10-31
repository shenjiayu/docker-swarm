#!/bin/bash

# run the redis-trib.rb script  (the docker inspect runs on the host and the echo output is passed the along to the ruby container)
 docker run -it --rm ruby sh -c "\
  gem install redis \
  && wget http://download.redis.io/redis-stable/src/redis-trib.rb \
  && ruby redis-trib.rb create --replicas 0 \
  $(docker-machine ip master):\"6379\" \
  $(docker-machine ip mix):\"6379\" \
  $(docker-machine ip worker):\"6379\" " 

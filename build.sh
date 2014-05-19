#!/bin/bash

IMAGE=$(docker images | grep "rb_bench/base " |  awk '{print $3}')
if [[ -z $IMAGE ]]; then
  echo "rb_bench/base image not found... Try to build from ./dockerfiles/Base"
  docker build -t rb_bench/base - < ./dockerfiles/Base
fi

echo $IMAGE

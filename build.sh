#!/bin/bash

IMAGE=$(docker images | grep "rb_bench/base " |  awk '{print $3}')
if [[ -z $IMAGE ]]; then
  echo "rb_bench/base image not found... Try to build from ./dockerfiles/Base"
  docker build -t rb_bench/base - < dockerfiles/Base
fi

cat dockerfiles/Ruby | sed -e "s/\${sha}/5b629a7b8a344be1683a137f48d062634046f661/g" | docker build -t rb_bench/ruby -

#!/bin/bash

function commit_to_image {
  docker commit rb-bench rb-bench
  docker rm rb-bench
}

function run_on_rb_bench {
  docker run --name=rb-bench rb-bench "$@"
  commit_to_image
}

docker pull ubuntu:13.10

docker run --name=rb-bench ubuntu:13.10 apt-get update
commit_to_image

run_on_rb_bench apt-get install -y git

run_on_rb_bench git clone https://github.com/ruby/ruby.git

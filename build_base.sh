#!/bin/bash

function commit_to {
  docker commit $1 $1
  docker rm $1
}

function run_on {
  docker run --name=$1 $1 "${@:2}"
  commit_to $1
}

docker pull ubuntu:13.10

docker run --name=rb-bench-base ubuntu:13.10 apt-get update
commit_to rb-bench-base

run_on rb-bench-base apt-get install -y build-essential autoconf git ruby bison

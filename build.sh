#!/bin/bash

function commit_to_image {
  docker commit rb-bench rb-bench
  docker rm rb-bench
}

docker pull ubuntu:13.10

docker run --name=rb-bench ubuntu:13.10 apt-get update
commit_to_image

docker run --name=rb-bench rb-bench apt-get install -y git
commit_to_image

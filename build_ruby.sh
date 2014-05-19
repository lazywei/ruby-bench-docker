#/bin/bash

# This should be refactored
function commit_to {
  docker commit $1 $1
  docker rm $1
}

function run_on {
  docker run --name=$1 $1 "${@:2}"
  commit_to $1
}

docker run --name=rb-bench-mri rb-bench-base

#!/bin/bash

function commit_to_image {
  docker commit rb-bench rb-bench
  docker rm rb-bench
}

function run_on_rb_bench {
  docker run --name=rb-bench rb-bench "$@"
  commit_to_image
}

function run_in_ruby_dir {
  docker run -w /ruby --name=rb-bench rb-bench "$@"
  commit_to_image
}

docker pull ubuntu:13.10

docker run --name=rb-bench ubuntu:13.10 apt-get update
commit_to_image

run_on_rb_bench apt-get install -y build-essential
run_on_rb_bench apt-get install -y autoconf
run_on_rb_bench apt-get install -y git
run_on_rb_bench apt-get install -y ruby
run_on_rb_bench apt-get install -y bison

run_on_rb_bench git clone https://github.com/ruby/ruby.git

run_in_ruby_dir autoconf
run_in_ruby_dir ./configure
run_in_ruby_dir make
run_in_ruby_dir make install

run_on_rb_bench /usr/local/bin/ruby -v

Docker image for Ruby-bench
========
[![Build Status](https://travis-ci.org/lazywei/ruby-bench-docker.svg?branch=master)](https://travis-ci.org/lazywei/ruby-bench-docker)

## Requirements

- docker

## Run benchmarks with latest ruby

For [ruby benchmarks](https://github.com/ruby/ruby/tree/trunk/benchmark)

`./ruby_bench/runner.sh`

For [discourse](https://github.com/discourse/discourse)

`./discourse_bench/runner.sh`

### Or you can run it by yourself

All of the benchmarks are be executed in docker images, and thus you can run it manually.

Ruby:

`docker run -it --rm lazywei/rb_bench_ruby_bench`

Discourse:

`docker run -it --rm lazywei/rb_bench_discourse_bench`

With a specified commit hash:

`docker run -it --rm -e RAILS_COMMIT_HASH=7c4bfe lazywei/rb_bench_discourse_bench`

## Build docker images

If you don't want to use the images provided on docker index, you can build it from scratch:

`./build.sh`


## What these scripts does

- Pull ubuntu 13.10 image from docker index
- Install build tools, git and executable ruby by rbenv
- Run ruby benchmarks for 5 times and give measured time
- Run discourse test for 5 times and give measured time

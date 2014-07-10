Docker image for Ruby-bench
========
[![Build Status](https://travis-ci.org/lazywei/ruby-bench-docker.svg?branch=master)](https://travis-ci.org/lazywei/ruby-bench-docker)

## Requirements

- docker

## Run ruby benchmarks with latest ruby.

- `./ruby_bench/runner.sh`

### Or you can run it by yourself

- `docker run -it --rm lazywei/rb_bench_ruby_bench`

## Build docker images

If you don't want to use the images provided on docker index, you can build it from scratch:

- `./build.sh`


## What this script does

- Pull ubuntu 13.10 image from docker index
- Install build tools, git and executable ruby by rbenv
- Run ruby benchmarks for 5 times and give measured time

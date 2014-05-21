Docker image for Ruby-bench
========
[![Build Status](https://travis-ci.org/lazywei/ruby-bench-docker.svg?branch=master)](https://travis-ci.org/lazywei/ruby-bench-docker)

## Requirements

- docker

## Run

- `sh build.sh`

## What this script does

- Pull ubuntu 13.10 image from docker index
- Install build tools, git and executable ruby
- Clone latest ruby (branch: trunk) to `/ruby`
- Configure and make

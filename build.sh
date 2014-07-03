#!/bin/bash

RUBY_SHA=5b629a7b8a344be1683a137f48d062634046f661

BASE_IMG=$(docker images | grep "lazywei/rb_bench_base " |  awk '{print $3}')
if [[ -z $BASE_IMG ]]; then
  echo "lazywei/rb_bench_base image not found... Try to pull from docker index"
  docker pull lazywei/rb_bench_base
fi


RUBY_IMG=$(docker images | grep "^lazywei/rb_bench_base_ruby\s*${RUBY_SHA:0:5}" |  awk '{print $3}')
if [[ -z $RUBY_IMG ]]; then
  echo "lazywei/rb_bench_base_ruby:${RUBY_SHA:0:5} image not found... Try to build from ./base_ruby/Dockerfile"
  cat base_ruby/Dockerfile | sed -e "s/\${sha}/${RUBY_SHA}/g" | docker build -t lazywei/rb_bench_base_ruby:${RUBY_SHA:0:5} -
fi

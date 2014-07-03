#!/bin/bash

RUBY_SHA=5b629a7b8a344be1683a137f48d062634046f661

BASE_IMG=$(docker images | grep "lazywei/rb_bench_base " |  awk '{print $3}')
if [[ -z $BASE_IMG ]]; then
  echo "rb_bench/base image not found... Try to build from ./dockerfiles/Base"
  docker build -t rb_bench/base - < dockerfiles/Base
fi


RUBY_IMG=$(docker images | grep "^rb_bench/ruby\s*${RUBY_SHA:0:5}" |  awk '{print $3}')
if [[ -z $RUBY_IMG ]]; then
  echo "rb_bench/ruby:${RUBY_SHA:0:5} image not found... Try to build from ./dockerfiles/Ruby"
  cat dockerfiles/Ruby | sed -e "s/\${sha}/${RUBY_SHA}/g" | docker build -t rb_bench/ruby:${RUBY_SHA:0:5} -
fi

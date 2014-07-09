#!/bin/bash

RUBY_SHA=5b629a7b8a344be1683a137f48d062634046f661

docker pull lazywei/rb_bench_base

# We temporally use latest base_ruby for now.
# docker pull lazywei/rb_bench_base_ruby:${RUBY_SHA:0:5}
docker pull lazywei/rb_bench_base_ruby
if [[ $? != 0 ]]; then
  echo "Failed to pull from docker index... Try to build locally"
fi
# cat base_ruby/Dockerfile | sed -e "s/\${sha}/${RUBY_SHA}/g" | docker build -t lazywei/rb_bench_base_ruby:${RUBY_SHA:0:5} -

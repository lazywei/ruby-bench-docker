FROM lazywei/rb_bench_base_ruby:latest

MAINTAINER Bert Chang "https://github.com/lazywei"

WORKDIR /src/ruby

# Pull the latest ruby from github
RUN git pull origin trunk

ENTRYPOINT source /.bashrc && cd benchmark && ruby run.rb

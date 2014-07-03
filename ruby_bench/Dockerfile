FROM rb_bench/base:latest

MAINTAINER Bert Chang "https://github.com/lazywei"

RUN mkdir -p /src

RUN mkdir -p /src &&\
        cd /src &&\
        git clone https://github.com/ruby/ruby.git

WORKDIR /src/ruby

RUN ruby -v

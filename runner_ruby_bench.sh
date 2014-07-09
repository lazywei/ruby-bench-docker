#!/bin/bash

time for i in {1..5}; do docker run -it --rm lazywei/rb_bench_ruby_bench; done

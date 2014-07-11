#!/bin/bash

time for i in {1..5}; do docker run -it --rm -e RAILS_COMMIT_HASH=7c4bfe lazywei/rb_bench_discourse_bench; done

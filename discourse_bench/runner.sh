#!/bin/bash

for i in {1..5}; do
  starttime=$(($(date +%s%N)/1000000))
  docker run -it --rm -e RAILS_COMMIT_HASH=7c4bfe lazywei/rb_bench_discourse_bench
  endtime=$(($(date +%s%N)/1000000))
  elapsed=$(($endtime - $starttime))

  curl -i -H 'Content-Type: application/json' \
    -H 'Accept: application/json,application/vnd.ruby_bench;ver=1' \
    -H 'Authorization: Token token="123"' \
    -X POST http://localhost:3000/api/results \
    -d "{\"run\":{\"ruby_version\":\"2.0.0-p247\",\"git_hash\":\"c0a04be8ddcadcd89c02bc135e4b288f6d936704\",\"rails_version\": \"4.0.0\",\"rails_git_hash\":\"7c4bfe\",\"date\":\"2013-12-18T12:09:16+00:00\",\"results_attributes\":[{\"benchmark\":\"some_bench\",\"score\":\"$elapsed\"}]}}"
done

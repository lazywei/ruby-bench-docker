#!/bin/bash

git remote update
git checkout HEAD

if [[ -n "$RAILS_COMMIT_HASH" ]]; then
  echo "We are going to use specified Rails commit {$RAILS_COMMIT_HASH}"
  sed -i -e "s/gem 'rails'$/gem 'rails', github: 'rails\/rails', ref: '${RAILS_COMMIT_HASH}'/g" Gemfile
fi

bundle update rails
bundle
bundle exec rake docker:test

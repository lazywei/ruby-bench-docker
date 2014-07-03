#!/bin/bash

RUBY_SHA=5b629a7b8a344be1683a137f48d062634046f661

echo 'install_package "yaml-0.1.6" "http://pyyaml.org/download/libyaml/yaml-0.1.6.tar.gz#5fe00cda18ca5daeb43762b80c38e06e" --if needs_yaml' > ruby-${RUBY_SHA}
echo 'install_package "ruby-SHA" "https://github.com/ruby/ruby/archive/SHA.tar.gz" ldflags_dirs autoconf standard verify_openssl' | sed -e "s/SHA/${RUBY_SHA}/g" >> ruby-${RUBY_SHA}

source /.bashrc
rbenv install ruby-${RUBY_SHA}
rbenv global ruby-${RUBY_SHA}

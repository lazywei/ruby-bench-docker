#!/bin/bash

time for i in {1..5}; do docker run -it --rm samsaffron/discourse_test; done

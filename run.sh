#!/bin/bash

bundle install
chef-solo -c solo.rb -o solobook::default

#!/bin/bash

sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get install ruby2.2 ruby2.2-dev

gem install capifony
gem install capistrano-ext

gem install 'capistrano-strategy-copy-with-triggers'

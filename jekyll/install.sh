#! /bin/bash

# exit if a command fails
set -e

# install ruby 2.1
apt-get update && apt-get install -y ruby ruby-dev build-essential

# install jekyll & bundler (therubyracer needed for coffeescript support)
gem install jekyll bundler therubyracer --no-ri --no-rdoc

# cleanup package manager
apt-get remove --purge -y build-essential ruby-dev && apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# prepare dir
mkdir /source
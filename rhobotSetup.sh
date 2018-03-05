#!/bin/bash
set -x #echo on

wget --quiet -O $WORKSPACE/go1.8.3.linux-amd64.tar.gz https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz
mkdir $WORKSPACE/rhobot-for-el6/go -p
tar -xzf $WORKSPACE/go1.8.3.linux-amd64.tar.gz -C $WORKSPACE/rhobot/

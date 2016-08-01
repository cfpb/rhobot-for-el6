#!/bin/bash
set -x #echo on

cp /artifacts/rhobotGolangDependencies.tar.gz $WORKSPACE/rhobotGolangDependencies.tar.gz
wget --quiet -O $WORKSPACE/go1.6.2.linux-amd64.tar.gz https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz

mkdir $WORKSPACE/rhobot -p
tar -xzf $WORKSPACE/rhobotGolangDependencies.tar.gz -C $WORKSPACE/rhobot
tar -xzf $WORKSPACE/go1.6.2.linux-amd64.tar.gz -C $WORKSPACE/rhobot/

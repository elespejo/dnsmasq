#!/bin/bash

curdir=`cd $(dirname $0);pwd`
arch="$1"

docker build -f $curdir/Dockerfile-$arch -t elespejo/dnsmasq-$arch $curdir

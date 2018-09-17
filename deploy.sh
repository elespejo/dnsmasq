#! /bin/bash

USER=$1
PASS=$2
ARCH=$3
TAG=$4
docker login -u $USER -p $PASS
docker tag valerioperez/dnsmasq-$ARCH valerioperez/dnsmasq-$ARCH:$TAG
docker push valerioperez/dnsmasq-$ARCH:$TAG

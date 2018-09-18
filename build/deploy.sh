#! /bin/bash

USER=$1
PASS=$2
ARCH=$3
TAG=$4
docker login -u $USER -p $PASS
docker tag elespejo/dnsmasq-$ARCH elespejo/dnsmasq-$ARCH:$TAG
docker push elespejo/dnsmasq-$ARCH:$TAG

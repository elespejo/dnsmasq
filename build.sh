#!/bin/bash

arch="$1"

docker build -f Dockerfile-$arch -t elespejo/dnsmasq .

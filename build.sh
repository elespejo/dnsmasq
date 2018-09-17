#!/bin/bash

arch="$1"

docker build -t elespejo/dnsmasq:$arch-test

#!/bin/bash

docker-compose down

rm dnsmasq_log/*

for i in check_status.sh dnsmasq_conf dnsmasq_log docker-compose.yml Dockerfile init README.md
do
    git checkout $i
done

docker rmi meninasx86/dnsmasq-x86:test


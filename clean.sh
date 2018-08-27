#!/bin/bash

docker-compose down

for i in check_status.sh dnsmasq_conf docker-compose.yml Dockerfile init README.md
do
    git checkout $i
done

docker rmi meninasx86/dnsmasq-x86:test

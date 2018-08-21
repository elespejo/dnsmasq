#!/bin/bash

echo "Check docker compose :"
docker-compose ps 

echo -e "\nCheck docker container :"
docker ps -a | grep dnsmasq-x86_router_dnsmasq_1

echo -e "\nCheck docker logs :"
docker logs dnsmasq-x86_router_dnsmasq_1

echo -e "\nCheck netstat :"
sudo netstat -tunpl | grep docker-proxy

echo -e "\nResolve baidu and youtube :"
nslookup www.baidu.com 127.0.0.1
nslookup www.youtube.com 127.0.0.1

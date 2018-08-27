#!/bin/bash

function Hint() {
    hint="$1"

    Green="\033[0;32m"
    NC="\033[0m"
    printf "${Green}= ${NC}%.0s" {1..20}
    echo -e "\n${Green}${hint}${NC}"
    printf "${Green}= ${NC}%.0s" {1..20}
    echo -e "\n"  
}

Hint "Check docker compose :"
docker-compose ps 

Hint "Check docker container :"
docker ps -a | grep router_dnsmasq

Hint "Check docker logs :"
docker-compose logs

Hint "Check netstat :"
sudo netstat -tunpl | grep dnsmasq

Hint "Resolve baidu and youtube :"
nslookup www.baidu.com 127.0.0.1
nslookup www.youtube.com 127.0.0.1

Hint "Check script init in container :"
docker-compose exec router_dnsmasq ls -l init

Hint "Check /var/cache/apk/ empty in container :"
docker-compose exec router_dnsmasq ls -l /var/cache/apk/

Hint "Check /etc/dnsmasq and /etc/dnsmasq.d exist in container :"
docker-compose exec router_dnsmasq ls -l /etc/dnsmasq
docker-compose exec router_dnsmasq ls -l /etc/dnsmasq.d

Hint "Check process dnsmasq -k -C /etc/dnsmasq/dnsmasq.conf in container :"
docker-compose exec router_dnsmasq ps aux
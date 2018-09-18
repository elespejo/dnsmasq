#!/bin/bash


rm -f dnsmasq_log/*

docker rmi elespejo/dnsmasq-x86
docker rmi elespejo/dnsmasq-armv6

#!/bin/bash

DNS_SERVER=$1
PORT_START=$2
PORT_STOP=$3

for ((port=$PORT_START;port<=$PORT_STOP;port++))
do 
    echo "server=$DNS_SERVER#$port" >> dns-server.conf
done
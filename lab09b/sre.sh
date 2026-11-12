#!/bin/bash
###########################################
#basic SRE script
# monitor https://unreliablebanking.cloudroom.io 
# check for availability on the URL /getbalance
###########################################
url="https://unreliablebanking.cloudroom.io/getbalance"
while true; do
    sleep 2
    echo "Probing $url"
    curl --retry 3 --connect-timeout 3 $url
done

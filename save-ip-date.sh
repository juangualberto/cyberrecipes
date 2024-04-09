#!/bin/sh

IP=$(dig +short myip.opendns.com @resolver1.opendns.com)
FECHA=$(date +"%Y-%m-%d_%H:%M:%S")

echo $IP    $FECHA >> /root/lista.txt


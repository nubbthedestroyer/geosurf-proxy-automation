#!/usr/bin/env bash

service squid3 restart || service squid3 start

while true; do
    sleep 1
done
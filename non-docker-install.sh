#!/usr/bin/env bash

chmod +x *.sh
chmod +x *.py

./install-deps.sh

rm -rf /etc/sarg/sarg.conf
rm -rf /etc/squid/cachemgr.conf
rm -rf /etc/squid3/proxy-manager.py
rm -rf /etc/squid3/squid.conf
rm -rf /etc/squid3/users

sudo cp etc/sarg/* /etc/sarg
sudo cp etc/squid/* /etc/squid
sudo cp etc/squid3/* /etc/squid3

service squid3 restart
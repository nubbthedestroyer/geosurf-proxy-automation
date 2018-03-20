#!/usr/bin/env bash

chmod +x *.sh
chmod +x *.py

./install-deps.sh

rm -rf /etc/sarg/sarg.conf
rm -rf /etc/squid/cachemgr.conf
rm -rf /etc/squid3/proxy-manager.py
rm -rf /etc/squid3/squid.conf
rm -rf /etc/squid3/users

cp sarg/* /etc/sarg/
cp squid/* /etc/squid/
cp squid3/* /etc/squid3/
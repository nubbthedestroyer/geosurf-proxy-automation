#!/usr/bin/env bash

chmod +x *.sh
chmod +x *.py

./install-deps.sh

rm -rf /etc/sarg/sarg.conf
rm -rf /etc/squid/cachemgr.conf
rm -rf /etc/squid3/proxy-manager.py
rm -rf /etc/squid3/squid.conf
rm -rf /etc/squid3/users

cp etc/sarg/* /etc/sarg/
cp etc/squid/* /etc/squid/
cp etc/squid3/* /etc/squid3/
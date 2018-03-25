#!/usr/bin/env bash

chmod +x *.sh
chmod +x *.py

./install-deps.sh

rm -rf /etc/sarg/sarg.conf
rm -rf /etc/squid/cachemgr.conf
rm -rf /etc/squid/squid.conf
rm -rf /etc/squid3/*.py
rm -rf /etc/squid3/squid.conf
rm -rf /etc/squid3/users

sudo cp etc/sarg/* /etc/sarg
sudo cp etc/squid/* /etc/squid
mkdir -p /etc/squid3
sudo cp etc/squid3/* /etc/squid3
sudo cp etc/squid3/squid.conf /etc/squid

mkdir /var/spool/squid3
chown -R proxy:proxy /var/spool/squid3

sudo systemctl restart squid.service

cd /etc/squid3
python3 proxy-manager.py
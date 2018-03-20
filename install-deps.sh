#!/usr/bin/env bash

# Update list of packages
apt update

# Install dependent packages
apt install -y squid3 sarg python3 apache2 unzip mc python-pip dnsutils

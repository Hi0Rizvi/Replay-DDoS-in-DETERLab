#!/usr/bin/env bash

sudo apt-get install -y collectd-dev
sudo apt-get install -y bind9
sudo chmod 777 /etc/collectd/
scp /config/collectd.conf /etc/collectd/
sudo chmod 777 /etc/bind/
sudo scp /config/named.conf /etc/bind/
cd /etc/bind/
mkdir dynamic
mkdir slaves
sudo chmod 777 /etc/bind/slaves/
sudo scp zone-files/* /etc/bind/slaves/
sudo chmod 777 /etc/
sudo scp /name-server/resolv.conf /etc/

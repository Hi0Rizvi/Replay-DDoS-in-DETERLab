#!/usr/bin/env bash

HOME=/users/asmrizvi
sudo apt-get install -y libldns-dev
sudo apt-get install -y libtrace3-dev
sudo apt-get install -y libevent-dev
tar -xvf protobuf-all-3.6.1.tar.gz
cd $HOME/protobuf-3.6.1/
./configure --prefix=/usr 
cd $HOME/protobuf-3.6.1/
sudo make clean
cd $HOME/protobuf-3.6.1/
sudo make install 
cd $HOME/protobuf-3.6.1/
sudo ldconfig
sudo apt-get install -y libgoogle-glog-dev
sudo apt-get install -y libgflags-dev
cd $HOME/DNS-LDPlayer-All/client/dns-replay-controller/
sudo make dns_msg
sudo make

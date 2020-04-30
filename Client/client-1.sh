#!/usr/bin/env bash
HOME=/tmp
scp /users/asmrizvi/protobuf-all-3.6.1.tar.gz /tmp/
cd $HOME
tar -xvf protobuf-all-3.6.1.tar.gz
echo "--------------Installing libldns---------------------"
sudo apt-get install -y libldns-dev
echo "------------------------Installing libtrace-dev--------------------------"
sudo apt-get install -y libtrace3-dev
echo "-------------------------Installing libevent---------------------"
sudo apt-get install -y libevent-dev
echo "----------------Installing others---------------"
sudo apt-get install -y autoconf automake libtool curl make g++ unzip
cd $HOME/protobuf-3.6.1/
sudo make clean
echo "--------------------------Configuring protobuf-----------------------"
cd $HOME/protobuf-3.6.1/
sudo ./configure --prefix=/usr 
cd $HOME/protobuf-3.6.1/
sudo make
echo "-------------------------Installing protobuf-------------------------"
cd $HOME/protobuf-3.6.1/
sudo make install 
echo "-----------------------ldconfig----------------------"
cd $HOME/protobuf-3.6.1/
sudo ldconfig
echo "---------------------------Going directory replay client--------------------"
sudo cd /users/asmrizvi/DNS-LDPlayer-All/client/dns-replay-client
sudo make dns_msg
sudo make

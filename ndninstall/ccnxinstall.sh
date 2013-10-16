#!/bin/sh
# ================
# author: lihebi
# date: 10/15/2013
# ================
workspace='/home/hebi/Documents/GitHub/ndn'
depend='git libssl-dev libpcap-dev libxml2 libexpat-dev openjdk-7-jdk ant'
sudo apt-get install $depend
mkdir -p $workspace
cd $workspace
git clone https://github.com/ProjectCCNx/ccnx
cd ccnx
chmod +x configure
./configure
make
sudo make install

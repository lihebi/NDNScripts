#!/bin/sh
# =====================
# author: lihebi
# date: 10/15/2013
# =====================
sudo apt-get install gawk
workspace='/home/hebi/Documents/GitHub/ndn'
mkdir -p $workspace
cd $workspace
git clone https://github.com/named-data/OSPFN2.0
sudo adduser quagga
cd /usr/local/etc/
sudo mkdir quagga
sudo chown quagga:quagga quagga
sudo chmod g+w quagga
sudo mkdir quagga-state
sudo chown quagga:quagga quagga-state
sudo chmod g+w quagga-state
cd $workspace
cd OSPFN2.0
chmod +x ./configure
./configure --enable-opaque-lsa --disable-ipv6 --disable-ripd --disable-ripngd --disable-ospf6d --disable-bgpd --disable-bgp-announce --sysconfdir=/usr/local/etc/quagga --localstatedir=/usr/local/etc/quagga-state
make
sudo make install

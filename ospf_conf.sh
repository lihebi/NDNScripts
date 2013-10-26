#!/bin/sh
# ================
# author: lihebi
# date: 10/16/2013
# all rights reserved
# ================
myhost=V11.host
logfile=/tmp/ospfd.log
interface=face0 #maybe need increase
routerid=192.168.16.11 #need modify
cat > ospfd.conf <<EOF
hostname $myhost
password pwd
enable password pwd
log file $logfile
interface $interface
router ospf
 ospf router-id $routerid
 redistribute connected
 distribute-list ospfn out connected
 network 10.0.1.8/24 area 0.0.0.0
 capability opaque
line vty
EOF
sudo mv ospfd.conf /usr/local/etc/quagga/

cat > ospfn.conf <<EOF
ccnname $HOME/cs/ 1
ccnname $HOME/ee/ 2
logdir /tmp/
EOF
sudo mv ospfn.conf /usr/local/etc/quagga/

cat > zebra.conf <<EOF
hostname $myhost
password zebra
enable password zebra
EOF
sudo mv zebra.conf /usr/local/etc/quagga/

#!/bin/sh
# ===================
# author: lihebi
# date: 10/16/2013
# ===================

sudo modprobe ip_gre
cd /etc/network
sudo mv interfaces interfaces-bak
read -p 'enter interface name:>> ' interface
read -p 'enter my private ip:>> ' myprivateip
read -p 'enter your private ip:>> ' yourprivateip
read -p 'enter my ip:>> ' myip
read -p 'enter your ip:>> ' yourip
interface=hebi-interface
myprivateip=10.0.1.9
yourprivateip=10.0.1.10
myip=192.168.1.108
yourip=192.168.1.109
cd
cat > interfaces <<EOF
auto lo
iface lo inet loopback

auto $interface
iface $interface inet static
address $myprivateip
netmask 255.255.255.252
pre-up iptunnel add $interface mode gre local $myip remote $yourip ttl 255
pointopoint $yourprivateip
up ifconfig $interface multicast
EOF
sudo mv interfaces /etc/network/
sudo /etc/init.d/networking restart

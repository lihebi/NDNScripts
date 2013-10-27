#!/bin/sh
# ===================
# author: lihebi
# date: 10/16/2013
# ===================

sudo modprobe ip_gre
cd /etc/network
<<<<<<< HEAD
myip=192.168.16.8
face0_name=face0
face0_mygre=10.0.1.9
face0_remotegre=10.0.1.10
face0_remoteip=192.168.16.7
=======
myip=192.168.16.11
face0_name=face0
<<<<<<< HEAD
face0_mygre=10.0.1.10
face0_remotegre=10.0.1.9
face0_remoteip=192.168.16.8
=======
face0_mygre=10.0.1.9
face0_remotegre=10.0.1.8
face0_remoteip=192.168.16.10
>>>>>>> 018468b62698d876beb33da73c8b21627423c74b
face1_name=face1
face1_mygre=10.0.1.12
face1_remotegre=10.0.1.11
face1_remoteip=192.168.16.10
face2_name=face2
face2_mygre=10.0.1.11
face2_remotegre=10.0.1.20
face2_remoteip=192.168.1.128
cd
cat > interfaces <<EOF
auto lo
iface lo inet loopback

auto $face0_name
iface $face0_name inet static
address $face0_mygre
netmask 255.255.255.0
pre-up iptunnel add $face0_name mode gre local $myip remote $face0_remoteip ttl 255
pointopoint $face0_remotegre
up ifconfig $face0_name multicast

#auto $face1_name
#iface $face1_name inet static
#address $face1_mygre
#netmask 255.255.255.0
#pre-up iptunnel add $face1_name mode gre local $myip remote $face1_remoteip ttl 255
#pointopoint $face1_remotegre
#up ifconfig $face1_name multicast

#auto $face2_name
#iface $face2_name inet static
#address $face2_mygre
#netmask 255.255.255.0
#pre-up iptunnel add $face2_name mode gre local $myip remote $face2_remoteip ttl 255
#pointopoint $face2_remotegre
#up ifconfig $face2_name multicast

EOF
sudo mv interfaces /etc/network/
sudo /etc/init.d/networking restart

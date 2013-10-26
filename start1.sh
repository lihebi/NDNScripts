#!/bin/sh
sudo zebra -d
sudo ospfd -d -a
ccndstart
sudo ospfn -d -f /usr/local/etc/quagga/

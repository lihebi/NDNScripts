#!/bin/sh
sudo zebra -d
sleep 5
sudo ospfd -d -a
sleep 5
ccndstart
sleep 5
cd $ospfn
sudo ospfn -d

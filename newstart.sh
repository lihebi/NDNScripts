#!/bin/sh
sudo zebra -d
sudo ospfd -d -a
ccndstart
cd $ospfn
sudo ospfn -d

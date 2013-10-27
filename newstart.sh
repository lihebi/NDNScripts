#!/bin/sh
echo 'starting zebra...'
sudo zebra -d
sleep 5
echo 'starting ospfd...'
sudo ospfd -d -a
sleep 5
ccndstart
echo 'starting ospfn...'
sleep 5
cd $ospfn
sudo ospfn -d

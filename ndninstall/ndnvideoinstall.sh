#!/bin/sh
# ==================
# author: lihebi
# date: 10/15/2013
# ==================
workspace="$HOME/Documents/GitHub/ndn"
mkdir -p $workspace
depend='gstreamer0.10 python-gst0.10-dev'
sudo apt-get install $depend
cd $workspace
git clone https://github.com/named-data/ndnvideo
gst-launch-0.10 videotestsrc ! ximagesink

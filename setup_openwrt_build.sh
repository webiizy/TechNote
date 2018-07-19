#!/bin/bash

sudo apt-get update
sudo apt-get install -y git-core build-essential libssl-dev libncurses5-dev unzip gawk zlib1g-dev
sudo apt-get install -y subversion mercurial
git clone https://github.com/openwrt/openwrt.git
	
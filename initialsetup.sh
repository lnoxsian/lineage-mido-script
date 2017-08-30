#!/bin/bash

# CD to Home Directory
cd ~

# Install Required Packages
echo "1. Installing Require Packages | $(date)"
yes | sudo apt-get update
yes | sudo apt-get upgrade
yes | sudo apt-get install bc bison build-essential curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
yes | sudo apt-get install openjdk-8-jdk

# Fetch Android Platform Tools and Repo and to profile
echo "2. Installing Platform Tools & Repo Command| $(date)"
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
echo "# add Android SDK platform tools to path" >> ~/.profile
echo "if [ -d \"$HOME/platform-tools\" ] ; then" >> ~/.profile
echo "    PATH=\"$HOME/platform-tools:$PATH\"" >> ~/.profile
echo "fi" >> ~/.profile
source ~/.profile
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
echo "# set PATH so it includes user's private bin if it exists" >> ~/.profile
echo "if [ -d \"$HOME/bin\" ] ; then" >> ~/.profile
echo "    PATH=\"$HOME/bin:$PATH\"" >> ~/.profile
echo "fi" >> ~/.profile
source ~/.profile

# Create Directories
echo "3. Creating Directories | $(date)"
mkdir -p ~/bin
mkdir -p ~/android/lineage
cd ~/android/lineage

# Initialize Repo
echo "4. Initializing Repo | $(date)"
repo init -u https://github.com/LineageOS/android.git -b cm-14.1



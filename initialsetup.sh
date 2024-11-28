#!/bin/bash

# CD to Home Directory
cd ~

# Install Required Packages
echo "1. Installing Required Packages | $(date)"
yes | sudo apt-get update
yes | sudo apt-get upgrade
yes | sudo apt-get install bc bison build-essential curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-gtk3-dev libxml2 libxml2-utils lzop m4 pngcrush repo rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
yes | sudo apt-get install openjdk-8-jdk
yes | sudo apt-get install unzip

# Create Directories
echo "Creating bin Directory | $(date)"
mkdir -p ~/bin

# Fetch repo tool
echo "2. Installing Repo Tool"
curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/bin/repo
chmod a+x /usr/bin/repo

# Fetch Android Platform Tools
echo "3. Installing Platform Tools & Repo Command| $(date)"
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip
echo "# add Android SDK platform tools to path" >> ~/.profile
echo "if [ -d \"$HOME/platform-tools\" ] ; then" >> ~/.profile
echo "    PATH=\"$HOME/platform-tools:$PATH\"" >> ~/.profile
echo "fi" >> ~/.profile
source ~/.profile

# Setup Git & Initialize Repo
git config --global user.email "you@example.com"
git config --global user.name "YourName"

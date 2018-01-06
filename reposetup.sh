#!/bin/bash

# CD to Lineage Directory
echo "Creating Lineage Directory"
mkdir -p ~/android/lineage
cd ~/android/lineage

echo "1. Initializing Repo | $(date)"
yes | repo init -u https://github.com/LineageOS/android.git -b cm-14.1

# Sync Repo
echo "2. Syncing Repo | $(date)"
repo sync -j 16

# Run Breakfast
echo "3. Preparing device-specific code | $(date)"
source ~/android/lineage/build/envsetup.sh
breakfast mido

# Add Local Manifest
echo "4. Download Custom Local Manifest | $(date)"
cd ~/android/lineage/.repo/local_manifests/
rm roomservice.xml
wget https://raw.githubusercontent.com/itsarjunsinh/lineage-mido-script/master/roomservice.xml

# CD to Lineage Directory
cd ~/android/lineage

# Sync Repo
echo "5. Syncing Repo - Fetching Proprietary Files | $(date)"
repo sync -j 16

# Run Breakfast
echo "6. Preparing device-specific code | $(date)"
source ~/android/lineage/build/envsetup.sh
breakfast mido

# Enable CCache
# echo "export USE_CCACHE=1" >> ~/.bashrc
# ~/android/lineage/prebuilts/misc/linux-x86/ccache/ccache -M 100G

# Configure Jack
# echo "export ANDROID_JACK_VM_ARGS=\"-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx12G\"" >> ~/.bashrc

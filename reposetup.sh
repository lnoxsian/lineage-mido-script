#!/bin/bash

# CD to Lineage Directory
cd ~/android/lineage

# Sync Repo
echo "1. Syncing Repo | $(date)"
repo sync -j 16

# Run Breakfast
echo "2. Preparing device-specific code | $(date)"
source build/envsetup.sh
breakfast mido

# Add Local Manifest
echo "3. Download Custom Local Manifest | $(date)"
cd ~/android/lineage/.repo/local_manifests/
rm roomservice.xml
wget https://raw.githubusercontent.com/itsarjunsinh/lineage-mido-script/master/roomservice.xml

# CD to Lineage Directory
cd ~/android/lineage

# Sync Repo
echo "4. Syncing Repo - Fetching Proprietary Files | $(date)"
repo sync -j 16

# Run Breakfast
echo "5. Preparing device-specific code | $(date)"
source build/envsetup.sh
breakfast mido


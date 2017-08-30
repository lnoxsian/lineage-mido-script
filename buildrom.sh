#!/bin/bash

# CD to Lineage Directory
cd ~/android/lineage

# Configure Environment
echo "1. Configuring Environment | $(date)"
source build/envsetup.sh

# Sync Repo
echo "2. Syncing Repo | $(date)"
repo sync -j 16

# Build ROM
echo "3. Building ROM | $(date)"
brunch mido

# CD to OUT Dir
echo "Build finished at $(date)"
echo "Output Directory: "
cd $OUT
ls -l

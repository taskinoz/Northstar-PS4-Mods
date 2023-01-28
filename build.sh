#!/bin/bash

## This is an auto build script that can be used with the new RSPNVPK tool
## https://github.com/taskinoz/RSPNVPK
## Add the VPK that your editing in a /vpk folder
## eg. englishclient_frontend.bsp.pak000_dir.vpk

cp ./vpks/*.vpk ./

wait

# Build Frontend VPKS
RSPNVPK englishclient_frontend.bsp.pak000_dir.vpk -d ./src -s

# Build Multiplayer VPKS
RSPNVPK englishclient_frontend.bsp.pak000_dir.vpk -d ./src -s

# make dir ignore if exists
mkdir -p ../titanfall-plugin/CUSA04013/vpk_ps4

# Move to plugin folder
mv ./*.vpk ../titanfall-plugin/CUSA04013/vpk_ps4

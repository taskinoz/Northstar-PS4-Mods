#!/bin/bash

## This is an auto build script that can be used with the new RSPNVPK tool
## https://github.com/taskinoz/RSPNVPK
## Add the VPK that your editing in a /vpk folder
## eg. englishclient_frontend.bsp.pak000_dir.vpk

cp ./vpks/*.vpk ./

wait

# Build Frontend VPKS
if [ -d "./frontend" ]
then
    echo "Building Frontend VPK"
    RSPNVPK englishclient_frontend.bsp.pak000_dir.vpk -d ./frontend -s
else
    echo "Frontend VPK Ignored"
    rm ./englishclient_frontend.bsp.pak000_dir.vpk
fi


# Build Multiplayer VPKS
if [ -d "./mp_common" ]
then
    echo "Building Multiplayer VPK"
    RSPNVPK englishclient_mp_common.bsp.pak000_dir.vpk -d ./mp_common -s
else
    echo "Multiplayer VPK Ignored"
    rm ./englishclient_mp_common.bsp.pak000_dir.vpk
fi

# make dir ignore if exists
mkdir -p ./plugins/CUSA04013/vpk_ps4

# Move to plugins folder
mv ./*.vpk ./plugins/CUSA04013/vpk_ps4

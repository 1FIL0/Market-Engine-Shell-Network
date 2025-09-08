#!/bin/bash

HERE="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
UTILS_PATH=$HERE/../utils
source $UTILS_PATH/platform_program_commands.sh PROGRAM=API $@

if [[ $ARG_PLATFORM != $PLATFORM_LINUX_X86_64 ]]; then
    echo "Appimages only supported on linux"
    exit 1
fi

APP_BIN_DIR=$APPIMG_API_DIR/bin

rm $APPIMG_API_PATH 2> /dev/null
mkdir -p $APP_BIN_DIR
rm -r $APP_BIN_DIR/* 2> /dev/null

./check_make_binaries.sh PROGRAM=API $@
cp -r $PPRO_API_SONAR_BUILD/dist/* $APP_BIN_DIR 2> /dev/null
cp -r $PPRO_API_LAUNCHER_BUILD/dist/* $APP_BIN_DIR 2> /dev/null
cp $MARKET_ENGINE_SHELL_DIST_LICENCES_PATH/LICENCE_MARKET_ENGINE_API.txt $APPIMG_API_DIR
cp $MARKET_ENGINE_SHELL_DIST_LICENCES_PATH/LICENCE_GPL3.txt $APPIMG_API_DIR
cp $MARKET_ENGINE_SHELL_DIST_LICENCES_PATH/LICENCE_OFL_1.1.txt $APPIMG_API_DIR

ARCH=x86_64 $APPIMG_PATH/appimagetool-x86_64.AppImage $APPIMG_API_DIR
mv $APPIMG_API_NAME $APPIMG_PATH

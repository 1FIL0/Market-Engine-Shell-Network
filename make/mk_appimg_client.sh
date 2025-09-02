#!/bin/bash

HERE="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
UTILS_PATH=$HERE/../utils
source $UTILS_PATH/platform_program_commands.sh PROGRAM=CLIENT $@

if [[ $ARG_PLATFORM != $PLATFORM_LINUX_X86_64 ]]; then
    echo "Appimages only supported on linux"
    exit 1
fi

APP_BIN_DIR=$APPIMG_CLIENT_DIR/bin

rm $APPIMG_CLIENT_PATH 2> /dev/null
mkdir -p $APP_BIN_DIR
rm -r $APP_BIN_DIR/* 2> /dev/null

./check_make_binaries.sh PROGRAM=CLIENT $@

cp -r $PPRO_CLIENT_APPLICATION_BUILD/dist/* $APP_BIN_DIR 2> /dev/null
cp -r $PPRO_CLIENT_SONAR_BUILD/dist/* $APP_BIN_DIR 2> /dev/null
cp -r $PPRO_CLIENT_ENGINE_BUILD/* $APP_BIN_DIR 2> /dev/null
cp -r $PPRO_CLIENT_LAUNCHER_BUILD/dist/* $APP_BIN_DIR 2> /dev/null

ARCH=x86_64 $APPIMG_PATH/appimagetool-x86_64.AppImage $APPIMG_CLIENT_DIR
mv $APPIMG_CLIENT_NAME $APPIMG_PATH

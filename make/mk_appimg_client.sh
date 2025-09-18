#!/bin/bash

#* Market Engine Shell Network
#* Copyright (C) 2025 OneFil (1FIL0) https://github.com/1FIL0
#*
#* This program is free software: you can redistribute it and/or modify
#* it under the terms of the GNU General Public License as published by
#* the Free Software Foundation, either version 3 of the License, or
#* (at your option) any later version.
#*
#* This program is distributed in the hope that it will be useful,
#* but WITHOUT ANY WARRANTY; without even the implied warranty of
#* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#* GNU General Public License for more details.
#*
#* You should have received a copy of the GNU General Public License
#* along with this program.  If not, see <http://www.gnu.org/licenses/>.
#* See LICENCE file.

HERE="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
UTILS_PATH=$HERE/../utils
source $UTILS_PATH/platform_program_commands.sh PROGRAM=CLIENT $@

if [[ $ARG_PLATFORM != $PLATFORM_LINUX_X86_64 ]]; then
    echo "Appimages only supported on linux"
    exit 1
fi

APP_BIN_DIR=$APPIMG_CLIENT_DIR/bin
APP_LIB_DIR=$APPIMG_CLIENT_DIR/usr/lib
APP_LICENCES_MARKET_ENGINE_CLIENT=$APPIMG_CLIENT_DIR/LICENCES_MARKET_ENGINE_CLIENT
APP_LICENCES_THIRD_PARTY_DIR=$APPIMG_CLIENT_DIR/LICENCES_THIRD_PARTY

rm $APPIMG_CLIENT_PATH 2> /dev/null
rm -r $APP_BIN_DIR/* 2> /dev/null
rm -r $APP_LIB_DIR/* 2> /dev/null
rm -r $APP_LICENCES_MARKET_ENGINE_CLIENT/* 2> /dev/null
rm -r $APP_LICENCES_THIRD_PARTY_DIR/* 2> /dev/null
mkdir -p $APP_BIN_DIR
mkdir -p $APP_LICENCES_MARKET_ENGINE_CLIENT
mkdir -p $APP_LICENCES_THIRD_PARTY_DIR

./check_make_binaries.sh PROGRAM=CLIENT $@

cp -r $PPRO_CLIENT_APPLICATION_BUILD/dist/* $APP_BIN_DIR 2> /dev/null
cp -r $PPRO_CLIENT_SONAR_BUILD/dist/* $APP_BIN_DIR 2> /dev/null
cp -r $PPRO_CLIENT_ENGINE_BUILD/engine $APP_BIN_DIR 2> /dev/null
cp -r $PPRO_CLIENT_LAUNCHER_BUILD/dist/* $APP_BIN_DIR 2> /dev/null

cp $MARKET_ENGINE_SHELL_DIST_LICENCES_PATH/LICENCES_MARKET_ENGINE_CLIENT/* $APP_LICENCES_MARKET_ENGINE_CLIENT
cp $MARKET_ENGINE_SHELL_DIST_LICENCES_PATH/LICENCES_THIRD_PARTY/LICENCES_PIP_Client.json $APP_LICENCES_THIRD_PARTY_DIR
cp $MARKET_ENGINE_SHELL_DIST_LICENCES_PATH/LICENCES_THIRD_PARTY/LICENCE_SystemHud.txt $APP_LICENCES_THIRD_PARTY_DIR
cp $MARKET_ENGINE_SHELL_DIST_LICENCES_PATH/LICENCES_THIRD_PARTY/LICENCE_OpenSSL.txt $APP_LICENCES_THIRD_PARTY_DIR
cp $MARKET_ENGINE_SHELL_DIST_LICENCES_PATH/LICENCES_THIRD_PARTY/LICENCE_RapidJson.txt $APP_LICENCES_THIRD_PARTY_DIR
cp $MARKET_ENGINE_SHELL_DIST_LICENCES_PATH/LICENCES_THIRD_PARTY/LICENCE_boost.txt $APP_LICENCES_THIRD_PARTY_DIR

if [[ $ARG_PLATFORM == $PLATFORM_WINDOWS_X86_64 ]]; then
    cp $MARKET_ENGINE_SHELL_DIST_LICENCES_PATH/LICENCES_THIRD_PARTY/LICENCE_gcc*.txt $APP_LICENCES_THIRD_PARTY_DIR
    cp $MARKET_ENGINE_SHELL_DIST_LICENCES_PATH/LICENCES_THIRD_PARTY/LICENCE_libwinpthread.txt $APP_LICENCES_THIRD_PARTY_DIR
fi

cp $PPRO_CLIENT_ENGINE_BUILD_LIB/* $APP_LIB_DIR

ARCH=x86_64 $APPIMG_PATH/appimagetool-x86_64.AppImage $APPIMG_CLIENT_DIR
mv $APPIMG_CLIENT_NAME $APPIMG_PATH

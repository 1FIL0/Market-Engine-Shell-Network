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
source $UTILS_PATH/platform_program_commands.sh PROGRAM=API $@

if [[ $ARG_PLATFORM != $PLATFORM_LINUX_X86_64 ]]; then
    echo "Appimages only supported on linux"
    exit 1
fi

APP_BIN_DIR=$APPIMG_API_DIR/bin
APP_LICENCES_MARKET_ENGINE_API=$APPIMG_API_DIR/LICENCES_MARKET_ENGINE_API
APP_LICENCES_THIRD_PARTY_DIR=$APPIMG_API_DIR/LICENCES_THIRD_PARTY

rm $APPIMG_API_PATH 2> /dev/null
rm -r $APP_BIN_DIR/* 2> /dev/null
rm -r $APP_LICENCES_MARKET_ENGINE_API/* 2> /dev/null
rm -r $APP_LICENCES_THIRD_PARTY_DIR/* 2> /dev/null
mkdir -p $APP_BIN_DIR
mkdir -p $APP_LICENCES_MARKET_ENGINE_API
mkdir -p $APP_LICENCES_THIRD_PARTY_DIR

./check_make_binaries.sh PROGRAM=API $@
cp -r $PPRO_API_SONAR_BUILD/dist/* $APP_BIN_DIR 2> /dev/null
cp -r $PPRO_API_LAUNCHER_BUILD/dist/* $APP_BIN_DIR 2> /dev/null

cp $MARKET_ENGINE_SHELL_DIST_LICENCES_PATH/LICENCES_MARKET_ENGINE_API/* $APP_LICENCES_MARKET_ENGINE_API
cp $MARKET_ENGINE_SHELL_DIST_LICENCES_PATH/LICENCES_THIRD_PARTY/LICENCES_PIP_Api.json $APP_LICENCES_THIRD_PARTY_DIR

ARCH=x86_64 $APPIMG_PATH/appimagetool-x86_64.AppImage $APPIMG_API_DIR
mv $APPIMG_API_NAME $APPIMG_PATH

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

./check_make_binaries.sh $@ PROGRAM=API

echo ""
echo "--- CLEANING ---"

rm -rf $PPRO_ZIP_DIR_PATH/*
mkdir $PPRO_ZIP_DIR_PATH/bin
mkdir -p $PPRO_ZIP_DIR_PATH/LICENCES_THIRD_PARTY
mkdir -p $PPRO_ZIP_DIR_PATH/LICENCES_MARKET_ENGINE_API

echo ""
echo "--- COPYING FILES ---"
echo ""

cp -r $PPRO_API_SONAR_BUILD/dist/* $PPRO_ZIP_DIR_PATH/bin
cp -r $PPRO_API_LAUNCHER_BUILD/dist/* $PPRO_ZIP_DIR_PATH
cp $MARKET_ENGINE_SHELL_DIST_LICENCES_PATH/LICENCES_MARKET_ENGINE_API/* $PPRO_ZIP_DIR_PATH/LICENCES_MARKET_ENGINE_API
cp $MARKET_ENGINE_SHELL_DIST_LICENCES_PATH/LICENCES_THIRD_PARTY/LICENCES_PIP_Api.json $PPRO_ZIP_DIR_PATH/LICENCES_THIRD_PARTY

echo "--- CREATING ZIP ARCHIVE ---"
echo ""

rm $PPRO_ZIP_ARCHIVE_PATH
7z a $PPRO_ZIP_ARCHIVE_PATH $PPRO_ZIP_DIR_PATH

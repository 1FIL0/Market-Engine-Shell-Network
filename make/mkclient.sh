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

echo ""
echo "--- CLEANING ---"

cd $MARKET_ENGINE_CLIENT_TRADEUP_ENGINE/build/
rm -r $PPRO_CLIENT_APPLICATION_BUILD/* 2> /dev/null
rm -r $PPRO_CLIENT_SONAR_BUILD/* 2> /dev/null
rm -r $PPRO_CLIENT_ENGINE_BUILD/* 2> /dev/null
rm -r $PPRO_CLIENT_LAUNCHER_BUILD/* 2> /dev/null

echo ""
echo "--- MAKING M.E CLIENT TRADEUP ENGINE ---"
echo ""

mkdir -p $PPRO_CLIENT_ENGINE_BUILD_LIB

if [[ $ARG_PLATFORM == $PLATFORM_LINUX_X86_64 ]]; then
    ./clear_linux64.sh
    ./make_linux64.sh
    cp build_linux64/engine $PPRO_CLIENT_ENGINE_BUILD
    cd $HERE
    cp /lib/x86_64-linux-gnu/libcrypto.so.3 $PPRO_CLIENT_ENGINE_BUILD_LIB
    cp /lib/x86_64-linux-gnu/libgomp.so.1 $PPRO_CLIENT_ENGINE_BUILD_LIB
elif [[ $ARG_PLATFORM == $PLATFORM_WINDOWS_X86_64 ]]; then
    ./clear_win64.sh
    ./make_win64.sh
    cp build_win64/engine $PPRO_CLIENT_ENGINE_BUILD
    cd $HERE
    cp /mingw64/bin/libgomp-1.dll $PPRO_CLIENT_ENGINE_BUILD_LIB
    cp /mingw64/bin/libcrypto-3-x64.dll $PPRO_CLIENT_ENGINE_BUILD_LIB
    cp /mingw64/bin/libwinpthread-1.dll $PPRO_CLIENT_ENGINE_BUILD_LIB
    cp /mingw64/bin/libgcc_s_seh-1.dll $PPRO_CLIENT_ENGINE_BUILD_LIB
    cp /mingw64/bin/libstdc++-6.dll $PPRO_CLIENT_ENGINE_BUILD_LIB
    cp /mingw64/bin/libwinpthread-1.dll $PPRO_CLIENT_ENGINE_BUILD_LIB
fi

source $PPRO_PLATFORM_PROGRAM_ACTIVATE_VENV

echo ""
echo "--- MAKING M.E CLIENT APPLICATION ---"
echo ""

$PPRO_PLATFORM_PROGRAM_COMMAND_RUN_VENV_PYTHON -m PyInstaller --onedir --paths=$MARKET_ENGINE_SHARE_SRC $MARKET_ENGINE_CLIENT_APPLICATION/src/main.py\
    --add-data $PPRO_MARKET_ENGINE_ASSETS_DEMANGLED_PATH:market_engine_assets --workpath $PPRO_CLIENT_APPLICATION_BUILD/build --distpath $PPRO_CLIENT_APPLICATION_BUILD/dist\
    --specpath $PPRO_CLIENT_APPLICATION_BUILD --noconsole --icon $MARKET_ENGINE_ASSETS_PATH/icons_market_engine_brand/market_engine_client_desktop.ico -n application


echo ""
echo "--- MAKING M.E CLIENT SONAR ---"
echo ""

$PPRO_PLATFORM_PROGRAM_COMMAND_RUN_VENV_PYTHON -m PyInstaller --onedir --paths=$MARKET_ENGINE_SHARE_SRC $MARKET_ENGINE_CLIENT_SONAR/src/main.py\
    --add-data $PPRO_MARKET_ENGINE_ASSETS_DEMANGLED_PATH:market_engine_assets --workpath $PPRO_CLIENT_SONAR_BUILD/build --distpath $PPRO_CLIENT_SONAR_BUILD/dist\
    --specpath $PPRO_CLIENT_SONAR_BUILD --noconsole -n sonar

echo ""
echo "--- MAKING M.E CLIENT LAUNCHER ---"
echo ""

$PPRO_PLATFORM_PROGRAM_COMMAND_RUN_VENV_PYTHON -m PyInstaller --onefile --paths=$MARKET_ENGINE_SHARE_SRC $MARKET_ENGINE_CLIENT_LAUNCHER/src/main.py\
    --workpath $PPRO_CLIENT_LAUNCHER_BUILD/build --distpath $PPRO_CLIENT_LAUNCHER_BUILD/dist\
    --specpath $PPRO_CLIENT_LAUNCHER_BUILD --noconsole --icon $MARKET_ENGINE_ASSETS_PATH/icons_market_engine_brand/market_engine_client_desktop.ico -n launcher

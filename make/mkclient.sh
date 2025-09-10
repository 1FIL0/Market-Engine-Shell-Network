#!/bin/bash

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
fi

source $PPRO_PLATFORM_PROGRAM_ACTIVATE_VENV

echo ""
echo "--- MAKING M.E CLIENT APPLICATION ---"
echo ""

$PPRO_PLATFORM_PROGRAM_COMMAND_RUN_VENV_PYTHON -m PyInstaller --onedir --paths=$MARKET_ENGINE_SHARE_SRC $MARKET_ENGINE_CLIENT_APPLICATION/src/main.py\
    --add-data $PPRO_MARKET_ENGINE_ASSETS_DEMANGLED_PATH:market_engine_assets --workpath $PPRO_CLIENT_APPLICATION_BUILD/build --distpath $PPRO_CLIENT_APPLICATION_BUILD/dist\
    --specpath $PPRO_CLIENT_APPLICATION_BUILD --noconsole -n application


echo ""
echo "--- MAKING M.E CLIENT SONAR ---"
echo ""

$PPRO_PLATFORM_PROGRAM_COMMAND_RUN_VENV_PYTHON -m PyInstaller --onedir --paths=$MARKET_ENGINE_SHARE_SRC $MARKET_ENGINE_CLIENT_SONAR/src/main.py\
    --add-data $PPRO_MARKET_ENGINE_ASSETS_DEMANGLED_PATH:market_engine_assets --workpath $PPRO_CLIENT_SONAR_BUILD/build --distpath $PPRO_CLIENT_SONAR_BUILD/dist\
    --specpath $PPRO_CLIENT_SONAR_BUILD -n sonar

echo ""
echo "--- MAKING M.E CLIENT LAUNCHER ---"
echo ""

$PPRO_PLATFORM_PROGRAM_COMMAND_RUN_VENV_PYTHON -m PyInstaller --onefile --paths=$MARKET_ENGINE_SHARE_SRC $MARKET_ENGINE_CLIENT_LAUNCHER/src/main.py\
    --workpath $PPRO_CLIENT_LAUNCHER_BUILD/build --distpath $PPRO_CLIENT_LAUNCHER_BUILD/dist\
    --specpath $PPRO_CLIENT_LAUNCHER_BUILD --noconsole --icon $MARKET_ENGINE_ASSETS_PATH/icons_market_engine_brand/market_engine_client_desktop.ico -n launcher

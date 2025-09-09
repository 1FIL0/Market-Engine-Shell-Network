#!/bin/bash

HERE="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
UTILS_PATH=$HERE/../utils
source $UTILS_PATH/platform_program_commands.sh PROGRAM=API $@

echo ""
echo "--- CLEANING ---"

rm -r $PPRO_API_SONAR_BUILD/* 2> /dev/null
rm -r $PPRO_API_LAUNCHER_BUILD/* 2> /dev/null
source $PPRO_PLATFORM_PROGRAM_ACTIVATE_VENV

echo ""
echo "--- MAKING M.E API SONAR ---"
echo ""

$PPRO_PLATFORM_PROGRAM_COMMAND_RUN_VENV_PYTHON -m PyInstaller --onedir --paths=$MARKET_ENGINE_SHARE_SRC $MARKET_ENGINE_API_SONAR/src/main.py\
    --workpath $PPRO_API_SONAR_BUILD/build --distpath $PPRO_API_SONAR_BUILD/dist\
    --specpath $PPRO_API_SONAR_BUILD -n sonar

echo ""
echo "--- MAKING M.E API LAUNCHER ---"
echo ""

$PPRO_PLATFORM_PROGRAM_COMMAND_RUN_VENV_PYTHON -m PyInstaller --onefile --paths=$MARKET_ENGINE_SHARE_SRC $MARKET_ENGINE_API_LAUNCHER/src/main.py\
    --workpath $PPRO_API_LAUNCHER_BUILD/build --distpath $PPRO_API_LAUNCHER_BUILD/dist\
    --specpath $PPRO_API_LAUNCHER_BUILD --icon $MARKET_ENGINE_ASSETS_PATH/icons_market_engine_brand/market_engine_api_desktop.ico -n launcher
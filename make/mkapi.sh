#!/bin/bash

HERE="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
UTILS_PATH=$HERE/../utils
source $UTILS_PATH/platform_program_commands.sh PROGRAM=API $@

echo ""
echo "--- PREPARING ---"
echo ""

rm -r $PPRO_API_SONAR_BUILD/* 2> /dev/null
source $PPRO_PLATFORM_PROGRAM_ACTIVATE_VENV

echo ""
echo "--- MAKING M.E API SONAR ---"
echo ""

$PPRO_PLATFORM_PROGRAM_COMMAND_RUN_VENV_PYTHON -m PyInstaller --onedir --paths=$MARKET_ENGINE_SHARE_SRC $MARKET_ENGINE_API_SONAR/src/main.py\
    --workpath $PPRO_API_SONAR_BUILD/build  --distpath $PPRO_API_SONAR_BUILD/dist\
    --specpath $PPRO_API_SONAR_BUILD -n sonar

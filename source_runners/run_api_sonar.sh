#!/bin/bash

HERE="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
UTILS_PATH=$HERE/../utils
source $UTILS_PATH/platform_program_commands.sh PROGRAM=API $@

source $PPRO_PLATFORM_PROGRAM_ACTIVATE_VENV
$PPRO_PLATFORM_PROGRAM_COMMAND_RUN_VENV_PYTHON $MARKET_ENGINE_API_SONAR/src/main.py --dist dev $@
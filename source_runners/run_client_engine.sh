#!/bin/bash

HERE="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
UTILS_PATH=$HERE/../utils
source $UTILS_PATH/platform_program_commands.sh PROGRAM=CLIENT $@

$PPRO_CLIENT_ENGINE_BINARY $@
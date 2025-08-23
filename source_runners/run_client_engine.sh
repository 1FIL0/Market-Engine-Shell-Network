#!/bin/bash

HERE="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
UTILS_PATH=$HERE/../utils
source $HERE/platform_program_commands.sh

$PPRO_CLIENT_ENGINE_BINARY
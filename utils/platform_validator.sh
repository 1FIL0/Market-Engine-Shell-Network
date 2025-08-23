#!/bin/bash

HERE="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

source $HERE/args_platform.sh

if [[ $ARG_PLATFORM == "" ]]; then
    echo "You must specify a platform argument"
    exit 1
fi

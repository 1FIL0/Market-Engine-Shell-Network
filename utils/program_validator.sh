#!/bin/bash

HERE="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

source $HERE/args_program.sh

if [[ $ARG_PROGRAM == "" ]]; then
    echo "You must specify a program argument"
    exit 1
fi

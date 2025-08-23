#!/bin/bash

HERE="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

ARG_PROGRAM=""
ARG_PROGRAM_FULL=""
PROGRAM_CLIENT=CLIENT
PROGRAM_API=API

for arg in "$@"; do
    if [[ "$arg" != PROGRAM=* ]]; then
        continue
    fi

    if [[ "$arg" == "PROGRAM=CLIENT" ]]; then
        ARG_PROGRAM=$PROGRAM_CLIENT
        ARG_PROGRAM_FULL=$arg
    elif [[ "$arg" == "PROGRAM=API" ]]; then
        ARG_PROGRAM=$PROGRAM_API
        ARG_PROGRAM_FULL=$arg
    else
        echo "Unknown program argument: $arg"
        exit 1
    fi
done

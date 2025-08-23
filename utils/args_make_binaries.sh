#!/bin/bash

HERE="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

ARG_MAKE_BINARIES=false
MAKE_BINARIES_FALSE=false
MAKE_BINARIES_TRUE=true
ARG_MAKE_BINARIES_FULL=""

for arg in "$@"; do
    if [[ "$arg" != MAKE_BINARIES=* ]]; then
        continue
    fi

    if [[ "$arg" == "MAKE_BINARIES=FALSE" ]]; then
        ARG_MAKE_BINARIES=$MAKE_BINARIES_FALSE
        ARG_MAKE_BINARIES_FULL=$arg
    elif [[ "$arg" == "MAKE_BINARIES=TRUE" ]]; then
        ARG_MAKE_BINARIES=$MAKE_BINARIES_TRUE
        ARG_MAKE_BINARIES_FULL=$arg
    else
        echo "Unknown make binaries argument: $arg"
        exit 1
    fi
done

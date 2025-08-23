#!/bin/bash

HERE="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

PLATFORM_LINUX_X86_64=LINUX_X86_64
PLATFORM_WINDOWS_X86_64=WINDOWS_X86_64
ARG_PLATFORM=""
ARG_PLATFORM_FULL=""

for arg in "$@"; do
    if [[ "$arg" != PLATFORM=* ]]; then
        continue
    fi

    if [[ "$arg" == "PLATFORM=LINUX_X86_64" ]]; then
        ARG_PLATFORM=$PLATFORM_LINUX_X86_64
        ARG_PLATFORM_FULL=$arg
    elif [[ "$arg" == "PLATFORM=WINDOWS_X86_64" ]]; then
        ARG_PLATFORM=$PLATFORM_WINDOWS_X86_64
        ARG_PLATFORM_FULL=$arg
    else
        echo "Unknown platform argument: $arg"
        exit 1
    fi
done

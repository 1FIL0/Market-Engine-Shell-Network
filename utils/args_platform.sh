#!/bin/bash

#* Market Engine Shell Network
#* Copyright (C) 2025 OneFil (1FIL0) https://github.com/1FIL0
#*
#* This program is free software: you can redistribute it and/or modify
#* it under the terms of the GNU General Public License as published by
#* the Free Software Foundation, either version 3 of the License, or
#* (at your option) any later version.
#*
#* This program is distributed in the hope that it will be useful,
#* but WITHOUT ANY WARRANTY; without even the implied warranty of
#* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#* GNU General Public License for more details.
#*
#* You should have received a copy of the GNU General Public License
#* along with this program.  If not, see <http://www.gnu.org/licenses/>.
#* See LICENCE file.

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

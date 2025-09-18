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

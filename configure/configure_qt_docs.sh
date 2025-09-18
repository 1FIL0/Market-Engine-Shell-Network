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
UTILS_PATH=$HERE/../utils
source $UTILS_PATH/definitions.sh

pyuic5 $MARKET_ENGINE_ASSETS_PATH/ui/market_engine_client.ui -o $MARKET_ENGINE_CLIENT_APPLICATION/src/form_main_window.py
pyrcc5 $MARKET_ENGINE_ASSETS_PATH/qrc/market_engine_icons.qrc -o $MARKET_ENGINE_CLIENT_APPLICATION/src/market_engine_icons_rc.py
pyrcc5 $MARKET_ENGINE_ASSETS_PATH/qrc/brand_icons.qrc -o $MARKET_ENGINE_CLIENT_APPLICATION/src/brand_icons_rc.py
pyrcc5 $MARKET_ENGINE_ASSETS_PATH/qrc/third_party_icons.qrc -o $MARKET_ENGINE_CLIENT_APPLICATION/src/third_party_icons_rc.py

#!/bin/bash

HERE="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
UTILS_PATH=$HERE/../utils
source $UTILS_PATH/definitions.sh

pyuic5 $MARKET_ENGINE_ASSETS_PATH/ui/market_engine_client.ui -o $MARKET_ENGINE_CLIENT_APPLICATION/src/form_main_window.py
pyrcc5 $MARKET_ENGINE_ASSETS_PATH/icons/market_engine_icons.qrc -o $MARKET_ENGINE_CLIENT_APPLICATION/src/market_engine_icons_rc.py

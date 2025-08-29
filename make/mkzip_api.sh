#!/bin/bash

HERE="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
UTILS_PATH=$HERE/../utils
source $UTILS_PATH/platform_program_commands.sh PROGRAM=API $@

./check_make_binaries.sh $@ PROGRAM=API

echo ""
echo "--- CLEANING ---"

rm -rf $PPRO_ZIP_DIR_PATH/bin 2> /dev/null
mkdir $PPRO_ZIP_DIR_PATH/bin

echo ""
echo "--- COPYING FILES ---"
echo ""

cp -r $PPRO_API_SONAR_BUILD/dist/* $PPRO_ZIP_DIR_PATH/bin

echo "--- CREATING ZIP ARCHIVE ---"
echo ""

rm $PPRO_ZIP_ARCHIVE_PATH
7z a $PPRO_ZIP_ARCHIVE_PATH $PPRO_ZIP_DIR_PATH

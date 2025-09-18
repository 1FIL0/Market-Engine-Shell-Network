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

echo ""
echo "--- CLEARING EVERYTHING ---"
echo ""

rm -r $BUILD_PATH/* 2> /dev/null
rm $APPIMG_CLIENT_PATH 2> /dev/null
rm $APPIMG_API_PATH 2> /dev/null
rm -r $APPIMG_CLIENT_DIR/bin/* 2> /dev/null
rm -r $APPIMG_API_DIR/bin/* 2> /dev/null
rm -r $APPIMG_CLIENT_DIR/usr/lib/* 2> /dev/null
rm -r $ZIPDIR_CLIENT_LINUX_X86_64/* 2> /dev/null
rm -r $ZIPDIR_CLIENT_WINDOWS_X86_64/* 2> /dev/null
rm -r $ZIPDIR_API_LINUX_X86_64/* 2> /dev/null
rm -r $ZIPDIR_API_WINDOWS_X86_64/* 2> /dev/null
rm -r $ZIP_ARCHIVE_CLIENT_LINUX_X86_64_PATH 2> /dev/null
rm -r $ZIP_ARCHIVE_CLIENT_WINDOWS_X86_64_PATH 2> /dev/null
rm -r $ZIP_ARCHIVE_API_LINUX_X86_64_PATH 2> /dev/null
rm -r $ZIP_ARCHIVE_API_WINDOWS_X86_64_PATH 2> /dev/null

exit 0
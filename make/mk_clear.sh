#!/bin/bash

HERE="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
UTILS_PATH=$HERE/../utils
source $UTILS_PATH/definitions.sh

echo ""
echo "--- CLEARING EVERYTHING ---"
echo ""

rm -r $BUILD_PATH/* 2> /dev/null
rm $APPIMG_CLIENT_PATH 2> /dev/null
rm $APPIMG_API_PATH 2> /dev/null
rm $APPIMG_CLIENT_DIR/bin/* 2> /dev/null
rm $APPIMG_API_DIR/bin/* 2> /dev/null
rm $APPIMG_CLIENT_DIR/usr/share/* 2> /dev/null
rm -r $ZIPDIR_CLIENT_LINUX_X86_64/* 2> /dev/null
rm -r $ZIPDIR_CLIENT_WINDOWS_X86_64/* 2> /dev/null
rm -r $ZIPDIR_API_LINUX_X86_64/* 2> /dev/null
rm -r $ZIPDIR_API_WINDOWS_X86_64/* 2> /dev/null
rm -r $ZIP_ARCHIVE_CLIENT_LINUX_X86_64_PATH 2> /dev/null
rm -r $ZIP_ARCHIVE_CLIENT_WINDOWS_X86_64_PATH 2> /dev/null
rm -r $ZIP_ARCHIVE_API_LINUX_X86_64_PATH 2> /dev/null
rm -r $ZIP_ARCHIVE_API_WINDOWS_X86_64_PATH 2> /dev/null

exit 0
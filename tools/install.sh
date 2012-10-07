#!/bin/bash
#
# Use ADB to install openssh tools on a connected Android device.

set -e

SCRIPT_DIR=`cd $(dirname $0);pwd -P`

OPENSSH_DIR=$SCRIPT_DIR/../prebuilt/openssh

if [ ! -d "$OPENSSH_DIR" ]; then
    echo "Could not find  $OPENSSH_DIR"
    exit -1
fi

ADB=adb

command -v $ADB >/dev/null 2>&1 || { echo >&2 "Can't find the '$ADB' command. Aborting"; exit 1; }

DEVICE_BIN_DIR=/data/local/bin
DEVICE_LIB_DIR=/data/local/lib

adb shell mkdir $DEVICE_BIN_DIR
adb shell mkdir $DEVICE_LIB_DIR

BINS="sftp ssh scp"
LIBS="libssh.so"

for F in $BINS; do
    adb push $OPENSSH_DIR/armeabi-v7a/bin/$F $DEVICE_BIN_DIR
done

for F in $LIBS; do
    adb push $OPENSSH_DIR/armeabi-v7a/lib/$F $DEVICE_LIB_DIR
done

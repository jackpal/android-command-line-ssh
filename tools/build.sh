#!/bin/bash
#
# Use ADB to install openssh tools on a connected Android device.

set -e

SCRIPT_DIR=`cd $(dirname $0);pwd -P`

if [ "$ANDROID_NDK_ROOT" == "" ]; then
    echo "Expected ANDROID_NDK_ROOT to be defined."
    exit 1
fi

cd $SCRIPT_DIR/../jni

$ANDROID_NDK_ROOT/ndk-build -j8

PREBUILT=$SCRIPT_DIR/../prebuilt
PREBUILT_OPENSSH=$PREBUILT/openssh

cd $SCRIPT_DIR/..

rm -rf $PREBUILT
mkdir $PREBUILT
mkdir $PREBUILT_OPENSSH
mkdir $PREBUILT_OPENSSH/armeabi-v7a
mkdir $PREBUILT_OPENSSH/armeabi-v7a/bin
mkdir $PREBUILT_OPENSSH/armeabi-v7a/lib

OUT=obj/local/armeabi-v7a

cp $OUT/ssh_exe $PREBUILT_OPENSSH/armeabi-v7a/bin/ssh
cp $OUT/scp $PREBUILT_OPENSSH/armeabi-v7a/bin
cp $OUT/sftp $PREBUILT_OPENSSH/armeabi-v7a/bin
cp $OUT/libssh.so $PREBUILT_OPENSSH/armeabi-v7a/lib

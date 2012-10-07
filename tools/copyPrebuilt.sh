#!/bin/bash
#
# This script only needs to be run on a machine that's used to create the installer. It's currently
# hard-coded for Jack Palevich's development machine. It's checked in for safe keeping.

set -e

if [ `whoami` != "jackpal" ]; then
  echo This script only needs to be run on jackpal\'s machine.
  exit -1
fi

SCRIPT_DIR=`cd $(dirname $0);pwd -P`

ANDROID_SYSTEM_TREE='/Volumes/Android/jb-mr1-dev'

if [ ! -d "$ANDROID_SYSTEM_TREE" ]; then
    echo "Could not find Android system source tree at $ANDROID_SYSTEM_TREE"
    exit -2
fi

OUTPUT_BASE=$ANDROID_SYSTEM_TREE/out/target/product/grouper/system

if [ ! -d "$OUTPUT_BASE" ]; then
    echo "Could not find Android system build output at $OUTPUT_BASE"
    echo "Did you do a build of external/openssh ?"
    exit -3
fi

FILES="lib/libssh.so bin/ssh-keygen bin/sshd bin/sftp bin/ssh bin/scp"

PREBUILT=$SCRIPT_DIR/../prebuilt
PREBUILT_OPENSSH=$PREBUILT/openssh

rm -rf $PREBUILT
mkdir $PREBUILT
mkdir $PREBUILT_OPENSSH

cd $OUTPUT_BASE

for F in $FILES; do
  cp $F $PREBUILT_OPENSSH
done

cd $PREBUILT
git add .

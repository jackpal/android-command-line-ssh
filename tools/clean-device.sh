#!/bin/bash

set -e
ADB=adb

command -v $ADB >/dev/null 2>&1 || { echo >&2 "Can't find the '$ADB' command. Aborting"; exit 1; }

$ADB shell rm -r /data/local/bin
$ADB shell rm -r /data/local/lib

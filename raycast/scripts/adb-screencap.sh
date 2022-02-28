#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title adb-screencap
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Android commands

# Documentation:
# @raycast.description screen capture android device
# @raycast.author Hideki Hamada

PATH=$HOME/Library/Android/sdk/platform-tools/:$PATH

adb exec-out screencap -p > $HOME/Desktop/$(date +"%Y%m%d%H%M%S").png

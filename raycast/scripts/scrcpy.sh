#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title scrcpy
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Android commands

# Documentation:
# @raycast.description mirror real android device display
# @raycast.author Hideki Hamada

PATH=$HOME/Library/Android/sdk/platform-tools/:$PATH

scrcpy

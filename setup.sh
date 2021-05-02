#!/bin/bash

# REF: https://qiita.com/youcune/items/fcfb4ad3d7c1edf9dc96
set -eu

# jenv
jenv add "$(/usr/libexec/java_home -v 1.8)"
jenv add "$(/usr/libexec/java_home -v 14)"
jenv global 14

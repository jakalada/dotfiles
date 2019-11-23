export LANG="ja_JP.UTF-8"
export LC_ALL="ja_JP.UTF-8"

# Java
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Ruby on HomeBrew
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/tools/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

# esp-idf
# (not set when using FreeRTOS)
#export IDF_PATH=~/esp/esp-idf
#export PATH=~/esp/xtensa-esp32-elf/bin:$PATH

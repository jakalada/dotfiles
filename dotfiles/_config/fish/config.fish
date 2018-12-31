# Homebrew
set PATH /usr/local/bin $PATH

# Go
set GOPATH ~/go
set PATH $GOPATH/bin $PATH

# Ruby on HomeBrew
set PATH  /usr/local/opt/ruby/bin $PATH
set PATH /usr/local/lib/ruby/gems/2.6.0/bin $PATH

# Android
set ANDROID_HOME /usr/local/share/android-sdk

# esp-idf
# (not set when using FreeRTOS)
#export IDF_PATH=~/esp/esp-idf
#export PATH=~/esp/xtensa-esp32-elf/bin:$PATH

# abbr
alias g='git'
alias r='rails'
alias pf='platformio'

# replacement
if which rmtrash >/dev/null
  alias rm='rmtrash'
end

# function like alias
function pfr --description 'Build and upload by platformio'
  set -l parent_dir $PWD/..
  set -l src_dir $PWD/$argv[2]
  set -lx PLATFORMIO_LIB_DIR $parent_dir
  set -lx PLATFORMIO_SRC_DIR $src_dir
  platformio run --target=upload -e $argv[1]; and platformio serialports monitor
end

function pfb --description 'Build by platformio'
  set -l parent_dir $PWD/..
  set -l src_dir $PWD/$argv[2]
  set -lx PLATFORMIO_LIB_DIR $parent_dir
  set -lx PLATFORMIO_SRC_DIR $src_dir
  platformio run -e $argv[1]
end

fish_vi_key_bindings

# Fisherでインストールするプラグインのパスを変更
# REF: https://github.com/jorgebucaran/fisher#changing-the-installation-prefix
set -g fisher_path ~/.config/fisher
set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]
for file in $fisher_path/conf.d/*.fish
    builtin source $file 2> /dev/null
end

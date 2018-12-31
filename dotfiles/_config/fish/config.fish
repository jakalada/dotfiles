fish_vi_key_bindings

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

alias ph='peco_select_history'
alias pg='peco_select_ghq_repository'

# replacement
if which rmtrash >/dev/null
  alias rm='rmtrash'
end

# Fisherでインストールするプラグインのパスを変更
# REF: https://github.com/jorgebucaran/fisher#changing-the-installation-prefix
set -g fisher_path ~/.config/fisher
mkdir -p "$fisher_path/functions"
mkdir -p "$fisher_path/completions"
mkdir -p "$fisher_path/conf.d"
set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]
for file in $fisher_path/conf.d/*.fish
    builtin source $file 2> /dev/null
end


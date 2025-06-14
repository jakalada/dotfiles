fish_vi_key_bindings

# colors
set fish_color_error red
set fish_color_command green

# fundle
set fundle_plugins_dir "$HOME/.config/fundle_plugins"
mkdir -p "$fundle_plugins_dir"
fundle plugin 'jethrokuan/z'
fundle plugin '0rax/fish-bd'
fundle plugin 'decors/fish-ghq'
fundle plugin 'oh-my-fish/plugin-peco'
fundle init

# Java
#
# `brew install jenv`でインストールされるjenvのfish向けのスクリプトにシンボリックリンクを貼っているのbashとは異なり何もしない
#
#   dotfiles/_config/fish/functions/jenv.fish
#     -> usr/loca/opt/jenv/libexec/fish/jenv.fish
#   dotfiles/_config/fish/functions/export.fish
#     -> usr/loca/opt/jenv/libexec/fish/jenv.fish
#
# REF: https://github.com/gcuisinier/jenv#gettings-started

set -x LANG "ja_JP.UTF-8"
set -x LC_ALL "ja_JP.UTF-8"

set -x PATH '/usr/local/bin' $PATH
set -x PATH '/usr/local/sbin' $PATH

# asdf
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# Go
set -x GOPATH "$HOME/go"
set -x PATH "$GOPATH/bin" $PATH

# Ruby on Homebrew
set -x PATH '/opt/homebrew/opt/ruby/bin' $PATH
set -x PATH (gem environment gemdir)'/bin' $PATH

# Android
set -x ANDROID_HOME "$HOME/Library/Android/sdk"
set -x PATH "$ANDROID_HOME/emulator" $PATH
set -x PATH "$ANDROID_HOME/tools" $PATH
set -x PATH "$ANDROID_HOME/tools/bin" $PATH
set -x PATH "$ANDROID_HOME/platform-tools" $PATH

# anyenv
set -x PATH "$HOME/.anyenv/bin" $PATH
anyenv init - fish | source

# rust up
fish_add_path $HOME/.cargo/bin

# esp-idf
# (not set when using FreeRTOS)
#export IDF_PATH=~/esp/esp-idf
#export PATH=~/esp/xtensa-esp32-elf/bin:$PATH

alias ph='peco_select_history'
alias pd='peco_select_dirh'
alias pg='peco_select_ghq_repository'
alias asit='adb shell input text'
alias lsc='colorls -lA --sd'
alias ll='ls -l'


# replacement
if which rmtrash >/dev/null
  alias rm='rmtrash'
end

# starship
starship init fish | source

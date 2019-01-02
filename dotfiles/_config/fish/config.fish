fish_vi_key_bindings

# fundle
set fundle_plugins_dir "$HOME/.config/fundle_plugins"
mkdir -p "$fundle_plugins_dir"
fundle plugin 'jethrokuan/z'
fundle plugin '0rax/fish-bd'
fundle plugin 'decors/fish-ghq'
fundle plugin 'oh-my-fish/plugin-peco'
fundle plugin 'yoshiori/fish-peco_select_ghq_repository'
fundle init

# Java
set JAVA_HOME (/usr/libexec/java_home -v 11)
set PATH "$JAVA_HOME/bin" "$PATH"

# Go
set GOPATH "$HOME/go"
set PATH "$GOPATH/bin" $PATH

# Ruby on HomeBrew
set PATH /usr/local/opt/ruby/bin $PATH
set PATH /usr/local/lib/ruby/gems/2.6.0/bin $PATH

# Android
set ANDROID_HOME "$HOME/Library/Android/sdk"
set PATH "$ANDROID_HOME/tools/bin" $PATH
set PATH "$ANDROID_HOME/platform-tools" $PATH

# esp-idf
# (not set when using FreeRTOS)
#export IDF_PATH=~/esp/esp-idf
#export PATH=~/esp/xtensa-esp32-elf/bin:$PATH

alias ghq='env SHELL=/usr/local/bin/fish ghq'
alias ph='peco_select_history'
alias pg='peco_select_ghq_repository'

# replacement
if which rmtrash >/dev/null
  alias rm='rmtrash'
end


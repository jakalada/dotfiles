#!/bin/zsh

##### Environment
export ZSH_CONFIG_DIR=$HOME/.zsh
export ZSH_PLUGIN_DIR=$ZSH_CONFIG_DIR/plugins
export VTE_CJK_WIDTH=1
export TERM="screen-256color"

##### Functions
function source_if_exists {
  if [ -f $1 ]; then
    source $1
  fi
}
##### Plugins

# zaw
# https://github.com/zsh-users/zaw
# see end of this script
# zsh-completions
# https://github.com/zsh-users/zsh-completions
fpath=($ZSH_PLUGIN_DIR/zsh-completions $fpath)
typeset -U fpath

# zsh-highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
source "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

##### Prompt
autoload -Uz promptinit && promptinit
autoload colors && colors

# 改行のない出力をプロンプトで上書きするのを防ぐ
unsetopt promptcr

# via @uasi
# http://d.hatena.ne.jp/uasi/20091025/1256458798
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

function rprompt-git-current-branch {
        local name st color gitdir action
        if [[ "$PWD" =~ /\.git(/.*)?$ ]]; then
                return
        fi
        name=$(git branch 2> /dev/null | grep '^\*' | cut -b 3-)
        if [[ -z $name ]]; then
                return
        fi

        gitdir=$(git rev-parse --git-dir 2> /dev/null)
        action=$(VCS_INFO_git_getaction "$gitdir") && action="($action)"

        st=$(git status 2> /dev/null)
        if echo "$st" | grep -q "^nothing to"; then
                color=%F\{green\}
        elif echo "$st" | grep -q "^nothing added"; then
                color=%F\{yellow\}
        elif echo "$st" | grep -q "^# Untracked"; then
                color=%B%F\{red\}
        else
                 color=%F\{red\}
        fi

        echo "$color$name$action%f%b "
}

setopt prompt_subst

PROMPT='[ `rprompt-git-current-branch`%~ ]
%(!.%{[1;31m%}#%{[m%}.%{[1;34m%}♪ %{[m%}) '

##### Default Keybinds
bindkey -e

##### History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt histignorealldups
setopt sharehistory

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end
bindkey '^K' history-incremental-pattern-search-backward
bindkey '^J' history-incremental-pattern-search-forward

##### Aliases

# replacement
if which trash-put &>/dev/null; then
  alias rm=trash-put
elif which rmtrash &>/dev/null; then
  alias rm=rmtrash
fi

# add options
if [ "$(uname)" = "Darwin" ]; then
  alias ls='ls -G'
elif [ "$(uname)" = "Linux" ]; then
  alias ls='ls --color=auto'
fi
alias grep='grep --colour=auto'
alias rspec='rspec --color'

# abbr
alias g='git'
alias r='rails'
alias pf='platformio'

# function like alias
function pfr() {
  parent_dir="${PWD}/.."
  src_dir="${PWD}/${2}"
  PLATFORMIO_LIB_DIR="${parent_dir:a}" PLATFORMIO_SRC_DIR="${src_dir:a}" platformio run --target=upload -e "${1}" && platformio serialports monitor -p "${3}"
}

function pfb() {
  parent_dir="${PWD}/.."
  src_dir="${PWD}/${2}"
  PLATFORMIO_LIB_DIR="${parent_dir:a}" PLATFORMIO_SRC_DIR="${src_dir:a}" platformio run -e "${1}"
}

alias la='ls -a' alias lal='la -l'
alias ll='ls -l' alias lla='ll -a'

# new
alias su='sudo -H -s'
alias filer='vim -c VimFiler'

##### Directory stack
setopt auto_pushd
setopt pushd_ignore_dups

##### Completion
autoload -Uz compinit && compinit

# zstyle
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command "ps -u $USER -o pid,%cpu,tty,cputime,cmd"


# for zaw
# source ${ZSH_PLUGIN_DIR}/zaw/zaw.zsh
#
# zstyle ':filter-select:highlight' matched fg=yellow,standout
# zstyle ':filter-select' max-lines 10 # use 10 lines for filter-select
# zstyle ':filter-select' max-lines -10 # use $LINES - 10 for filter-select
# zstyle ':filter-select' case-insensitive yes # enable case-insensitive search
# zstyle ':filter-select' extended-search yes # see below

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Android
export PATH="/Users/jakalada/Library/Android/sdk/platform-tools:/Users/jakalada/Library/Android/sdk/tools:$PATH"

### boot2docker
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/jakalada/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# The next line updates PATH for the Google Cloud SDK.
source_if_exists '/Users/jakalada/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source_if_exists '/Users/jakalada/google-cloud-sdk/completion.zsh.inc'

export PATH="$HOME/usr/src/google-cloud-sdk/bin:$PATH"

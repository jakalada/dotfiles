#!/bin/bash

# REF: https://qiita.com/youcune/items/fcfb4ad3d7c1edf9dc96
set -eu

relative_file_path_list=(
"Library/Application Support/Code/User/settings.json"
"Library/Application Support/Code/User/keybindings.json"
".config/fish/completions"
".config/fish/config.fish"
".config/fish/functions"
".config/karabiner/karabiner.json"
".config/nvim"
".config/zed/keymap.json"
".config/zed/settings.json"
".gitconfig"
".gitignore.base"
".hyper.js"
".ideavimrc"
".jshintrc"
".tern-project"
".textlintrc"
".bash_profile"
".bashrc"
".vim"
".vimrc"
".xvimrc"
)

cd $(dirname $0)

for name in "${relative_file_path_list[@]}"; do
  # 存在しないディレクトリを作成
  dir_path=$(dirname "$name")
  if [ "${dir_path}" != "." ]; then
    mkdir -p "$HOME/${dir_path}"
  fi

  # 各ファイル、ディレクトリのシンボリックリンクを作成
  ln -s -f -F -h "`pwd`/dotfiles/${name}" "$HOME/$name" && echo "created: $HOME/$name"
done

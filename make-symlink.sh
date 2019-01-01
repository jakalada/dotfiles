#!/bin/bash
set -e

relative_file_path_list=(
".config/fish/completions"
".config/fish/config.fish"
".config/fish/functions"
".config/karabiner/karabiner.json"
".gitconfig"
".gitignore.base"
".ideavimrc"
".jshintrc"
".tern-project"
".bash_profile"
".bashrc"
".vim"
".vimrc"
)

cd $(dirname $0)

for name in "${relative_file_path_list[@]}"; do
  # 存在しないディレクトリを作成
  dir_path=$(dirname $name)
  if [ "${dir_path}" != "." ]; then
    mkdir -p "$HOME/${dir_path}"
  fi

  # 各ファイル、ディレクトリのシンボリックリンクを作成
  ln -s -f -F -h "`pwd`/dotfiles/_${name:1}" "$HOME/$name" && echo "created: $HOME/$name"
done

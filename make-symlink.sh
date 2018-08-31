#!/bin/bash
set -e

relative_file_path_list=(
".config/fish/completions"
".config/fish/config.fish"
".config/fish/fishfile"
".config/fish/functions"
".gitconfig"
".gitignore.base"
".ideavimrc"
".jshintrc"
".tern-project"
)

cd `dirname $0`

for name in "${relative_file_path_list[@]}"; do
  if [ ! -e "$HOME/$name" ]; then
    ln -s "`pwd`/dotfiles/$name" "$HOME/$name" && echo "created: $HOME/$name"
  else
    echo "skip: $HOME/$name"
  fi
done

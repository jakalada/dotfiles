#!/bin/bash
set -e

relative_file_path_list=(
".config/fish"
".gitconfig"
".gitignore.base"
".jshintrc"
".tern-project"
".vim"
".zshrc"
"volt/lock.json"
"volt/plugconf"
"volt/rc"
)

cd `dirname $0`

for name in "${relative_file_path_list[@]}"; do
  if [ ! -e "$HOME/$name" ]; then
    ln -s "`pwd`/dotfiles/$name" "$HOME/$name" && echo "created: $HOME/$name"
  else
    echo "skip: $HOME/$name"
  fi
done

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
".bash_profile"
".bashrc"
)

cd `dirname $0`

for name in "${relative_file_path_list[@]}"; do
  ln -s -f "`pwd`/dotfiles/_${name:1}" "$HOME/$name" && echo "created: $HOME/$name"
done

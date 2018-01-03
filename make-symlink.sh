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
)

cd `dirname $0`

for name in "${relative_file_path_list[@]}"; do
	ln -s "`pwd`/dotfiles/$name" "$HOME/$name" && echo "created: $HOME/$name"
done

#!/bin/bash

# REF: https://qiita.com/youcune/items/fcfb4ad3d7c1edf9dc96
set -eu

# Homebrew
# ========

# Java
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk8
brew cask install adoptopenjdk9
brew cask install adoptopenjdk10
brew cask install adoptopenjdk11

# jenv
brew install jenv

# vim
brew install vim --HEAD

# yarn
brew install yarn

# prettier
brew install prettier

# yarn
# ===

# textlint
yarn global add textlint
yarn global add textlint-rule-preset-ja-technical-writing

# dotfiles

## Homebrew

- [Homebrew/homebrew\-bundle](https://github.com/Homebrew/homebrew-bundle)

### Install

```
$ brew bundle
```

### Dump

```
$ brew bundle dump # will create Brewfile
```

### そのほか

vimがpython@3.8に依存している間は、必要なPythonのモジュールは下記のようにインストールする。

```
$ /usr/local/opt/python@3.8/bin/pip3 install neovim pynvim
```

## anyenv

### Install

```
$ anyenv init
```

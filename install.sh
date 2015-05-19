#!/bin/sh

# special thanks for @kaorimatz

set -e
set -u

dotfiles=$HOME/.dotfiles

has() {
  type "$1" > /dev/null 2>&1
}

has_app() {
  [ "`uname -s`" = Darwin ] && osascript <<EOF > /dev/null 2>&1
tell application "Finder" to return name of application file id "$1"
EOF
}

symlink() {
  [ -e "$2" ] || [ -e "$2".norc ] || ln -s "$1" "$2"
}

if [ -d "$dotfiles" ]; then
  (cd "$dotfiles" && git pull --ff-only)
else
  git clone https://github.com/kikuchy/.dotfiles.git "$dotfiles"
  cd $dotfiles
  git submodule update --init
  cd $HOME
fi

if has vim; then
  symlink "$dotfiles/.vimrc" "$HOME/.vimrc"
  symlink "$dotfiles/.vim" "$HOME/.vim"
  symlink "$dotfiles/.gvimrc" "$HOME/.gvimrc"
fi

has git && symlink "$dotfiles/.gitignore" "$HOME/.gitignore"

curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

if [ "`uname -s`" = Darwin ]; then
  has git && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  cd $dotfiles
  brew brewdle
  cd $HOME
fi

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
  git config --global alias.c "commit -v"
  git config --global alias.o checkout
  git config --global alias.s status
  cd $HOME
fi

has git && symlink "$dotfiles/.gitignore" "$HOME/.gitignore"

curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

if [ "`uname -s`" = Darwin ]; then
  has git && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  cd $dotfiles
  mkdir -p $HOME/Library/Application\ Support/Karabiner
  ln -s $dotfiles/private.xml $HOME/Library/Application\ Support/Karabiner/private.xml
  if [ -d "$HOME/.config/karabiner" ]; then
      mkdir -p $HOME/config/karabiner
  fi
  symlink "$dotfiles/.config/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"
  symlink "$dotfiles/.zshrc.osx" "$HOME/.zshrc.osx"
  echo "source $HOME/.zshrc.osx" >> $HOME/.zshrc
  cd $HOME
fi

if has vim || has nvim; then
  symlink "$dotfiles/.vimrc" "$HOME/.vimrc"
  symlink "$dotfiles/.vim" "$HOME/.vim"
  symlink "$dotfiles/.gvimrc" "$HOME/.gvimrc"
  mkdir -p "$HOME/.config/nvim"
  symlink "$dotfiles/.vimrc" "$HOME/.config/nvim/init.vim"
fi

if has tmux; then
  symlink "$dotfiles/.tmux.conf" "$HOME/.tmux.conf"
  symlink "$dotfiles/.tmux" "$HOME/.tmux"
fi

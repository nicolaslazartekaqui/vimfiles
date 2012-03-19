# Vim files

## Install
  git clone git://github.com/nicolaslazartekaqui/vimfiles.git ~/.vim
  ln -s ~/.vim/vimrc ~/.vimrc
  cd ~/.vim
  git submodule init
  git submodule updat

## Upgrading all bundled plugins

  git submodule foreach git pull origin master

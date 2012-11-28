# Vim files

## Install
    git clone git://github.com/nicolaslazartekaqui/vimfiles.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim
    git submodule init
    git submodule update

## Upgrading all bundled plugins

    git submodule foreach git pull origin master

## Requisites

    # aptitude install exuberant-ctags

## Add other pluguin

    $ git submodule add git://github.com/... bundle/...
    $ git submodule init && git submodule update

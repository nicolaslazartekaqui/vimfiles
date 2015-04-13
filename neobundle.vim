if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

" plugins
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'wellbredgrapefruit/tomdoc.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'godlygeek/tabular'
NeoBundle 'ervandew/supertab'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'bling/vim-airline'

NeoBundleLazy 'othree/html5.vim', {'autoload': {'filetypes': ['html']}}
NeoBundleLazy 'Keithbsmiley/rspec.vim', {'autoload': {'filetypes': ['ruby']}}
NeoBundleLazy 'jelera/vim-javascript-syntax', {
      \ 'autoload': { 'filetypes': ['javascript', 'html'] }
      \ }

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

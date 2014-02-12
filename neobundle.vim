if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'othree/html5.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'groenewege/vim-less'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'bronson/vim-visual-star-search'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'Keithbsmiley/rspec.vim'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'ervandew/supertab'

" Kassio snippets
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'kassio/my-snippets'

filetype plugin indent on
NeoBundleCheck

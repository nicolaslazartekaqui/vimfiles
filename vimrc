" to load submodules 
call pathogen#infect()
call pathogen#helptags()

" to filetypes
if has("autocmd")
  filetype on
  filetype indent on
  filetype plugin on
endif

" turn on syntax
syntax on

" turn on numberline
set number

" to confirm before close
set confirm

" to search more friendly
set incsearch
set hls
set ignorecase
set smartcase

" show the current command in the lower right corner
set showcmd

" mouse enabled
set mouse=a

" ignore whitespace on diff
set diffopt+=iwhite

" define undolevels
set undolevels=1000

" show this when wrap a line
set showbreak=..

" file name on terminal title
set title

" load external updates
set autoread

" write external updates
set autowrite

" indent by default
set autoindent

" copy indent in/out
set copyindent

" show line with cursor
set cursorline

" tab default size is 2
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nojoinspaces
set shiftround
set smarttab

" to define backspace
set backspace=indent,eol,start

" turn session global
set sessionoptions+=globals

autocmd Filetype ruby,rb,rails,eruby set tw=110 formatoptions=tcq

set cursorcolumn

" define color scheme
function! SetColorscheme()
  set t_Co=256
  set background=dark
  colorscheme ir_black
  let g:background_status = 1
endfunction

if has("syntax")
  syntax enable
  silent! :call SetColorscheme()<CR>
  if has("folding")
    set fillchars=diff:\ ,fold:\ ,vert:\ 
  endif
endif

" create Y like D
nnoremap Y y$

" clear the highlight
nnoremap <C-L> :nohls<CR>:set hls?<CR>

" fixing some commands
cab W  w
cab Wq wq
cab wQ wq
cab WQ wq
cab Q  q

" NERDTree
let g:NERDTreeWinPos="right"
let NERDTreeHighlightCursorline=1
map <F5> :NERDTreeToggle<CR>
imap <F5> <ESC>:NERDTreeToggle<CR>

" to work with tabs
nmap <C-t> :tabnew<CR>
nmap <C-i> :tabnext<CR>
nmap <C-w> :tabclose<CR>

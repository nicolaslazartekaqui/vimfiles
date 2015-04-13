source ~/.vim/neobundle.vim

scriptencoding utf8
set encoding=utf8 fileencoding=utf8 termencoding=utf8 nobomb

set number numberwidth=3

runtime macros/matchit.vim
set showmatch

set ttyfast

set confirm

set shortmess=atTI

set splitright splitbelow

set incsearch hls ignorecase smartcase

set formatoptions=tcwqn2
set cursorline colorcolumn=80

set t_Co=256
syntax enable
set synmaxcol=500

set showcmd

set switchbuf=useopen,usetab,newtab
set tabpagemax=50

set list listchars=tab:▸\ ,trail:·

set virtualedit=block

set diffopt+=vertical

set nowrap wrapscan showbreak=..

set title

set autoread autowrite

set autoindent copyindent cindent smartindent
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab smarttab shiftround

set backspace=indent,eol,start

set mousehide mouse=a ttymouse=xterm2

set sessionoptions=buffers,tabpages,help

set nobackup nowritebackup noswapfile

set fileformats+=mac

let mapleader=','

" persist undo
set undofile undolevels=1000 undoreload=10000 undodir=~/.vim_data/undo

aug undo_dir
  au!
  au FileType gitcommit setlocal noundofile
  au VimEnter *
        \ if !isdirectory(&undodir) |
        \   call mkdir(expand(&undodir), "p", 0700) |
        \ endif
aug END

" filetypes setup
aug keyword
  au!
  au FileType html,javascript,css,eruby,sass,scss,yaml setlocal
        \ iskeyword+=-
aug END

" rspec syntax for features
aug rspec_syntax_for_features
  au!
  autocmd BufReadPost,BufNewFile *_feature.rb set syntax=rspec
aug END

" trim
function! Trim()
  let l:hls = &hls
  setlocal nohls
  call Preserve('%s/\v\s+$//e')
  call Preserve('%s/\v($\n\s*)+%$//e')
  let &hls = l:hls
endfunction
command! Trim call Trim()

function! Preserve(command)
  setlocal lazyredraw
  let l:search=@/

  let last_view = winsaveview()
  silent execute a:command
  call winrestview(last_view)

  let @/=l:search
  redraw
  setlocal nolazyredraw
endfunction

aug remove_trailing_spaces
  au!
  au BufWritePre * call Trim()
aug END

" keymaps
nnoremap Y y$
nnoremap <silent> <C-l> :nohls<CR>
noremap <silent> <leader>ff :call Preserve('normal gg=G')<CR>
nmap <C-t> :tabnew<CR>
nmap <C-i> :tabnext<CR>
nmap <C-w> :tabclose<CR>

cab W  w
cab Wq wq
cab wQ wq
cab WQ wq
cab Q  q

" NERDTree
let NERDTreeWinPos="right"
let NERDTreeHighlightCursorline=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1

function! OpenNERDTreeMirror()
  try
    :NERDTreeToggle | NERDTreeMirror
  catch /^Vim\%((\a\+)\)\=:E121/
    :NERDTree
  catch
    redraw
  endtry
endfunction

nmap <silent> <F5> :call OpenNERDTreeMirror()<CR>
nnoremap <silent> <leader>fl :NERDTreeFind<CR>

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_enable_balloons = 0
let g:syntastic_auto_jump = 0
let g:syntastic_error_symbol = 'e:'
let g:syntastic_warning_symbol = 'w:'
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [
      \ 'css',
      \ 'eruby',
      \ 'javascript',
      \ 'ruby',
      \ 'scss',
      \ 'sh',
      \ 'yaml'
      \ ] }

let g:syntastic_stl_format = ""
      \ . "%W{"
      \ . "[" . g:syntastic_warning_symbol . " %fw(%w)]"
      \ . "}"
      \ . "%E{"
      \ . "[" . g:syntastic_error_symbol . " %fe(%e)]"
      \ . "}"

let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_javascript_checkers = ['jscs']

" tabularize
vnoremap ,a= :Tabularize /=<CR>
nnoremap ,a= :normal vir,a=<CR>
cnoreabbrev Tab Tabularize

" airline
set laststatus=2

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '▶'
let g:airline_symbols.branch = '⎇'
let g:airline_right_sep = '◀'

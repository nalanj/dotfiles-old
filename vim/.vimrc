set nocompatible
filetype off
filetype plugin indent on

set noerrorbells
set showcmd
set showmode

" use a viminfo
set viminfo=%,'50,\"100,:100,n~/.viminfo

" more natural splits
set splitbelow
set splitright

" show line number
set number relativenumber

" put swap files elsewhere
if has('unix')
  set directory=$HOME/.vim/swap/
elseif has('win32')
  set directory=$HOME/vimfiles/swap/
endif

" set tab width stuff
set tabstop=2 shiftwidth=2
set smarttab
set expandtab
set backspace=indent,eol,start

set encoding=utf-8
set autowrite
set hidden
set laststatus=2

set ruler

" search config
set hlsearch
set ignorecase
set smartcase

" send characters more quickly
set ttyfast

" wrap options
set wrap
set textwidth=79

if has('mouse')
  set mouse=a
endif

syntax enable
set background=light
colorscheme PaperColor

" Some gui specific settings
if has("gui_running")
  set guifont=Office\ Code\ Pro\ D:h14
  set guioptions -=T
  set guioptions -=m
  set lines=999 columns=999
endif

let mapleader = ","

" Fast saving
nmap <leader>w <C-w>

" Fast close buffer
nmap <leader>q :bd<cr>

" set 80 character line limit
if exists('+colorcolumn')
  set colorcolumn=80
endif

" Set whitespace to show up selectively
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:~            " show trailing spaces as dots
set list

" list buffers with ;
nmap ; :BufExplorerHorizontalSplit<CR>

" find with leader t
nmap <Leader>t :find<Space>

" some vim-go stuff
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>gt <Plug>(go-test)
autocmd FileType go nmap <leader>gf <Plug>(go-test-func)

let g:go_fmt_autosave = 1
let g:go_fmt_command = 'goimports'
let g:go_metalinter_autosave = 1
augroup go
  autocmd!
  autocmd Filetype go
    \  command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    \| command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    \| command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup END

let g:lightline = {}
let g:lightline.colorscheme = 'PaperColor'

" copy and paste
vmap <C-c> "+y
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" RakeImport files syntax highlight as ruby
autocmd BufNewFile,BufRead RakeImport set syntax=ruby

" set path to $PWD/** to help with searching
set path=$PWD/**

" startify config
let g:startify_lists = [
  \ {'type': 'files', 'header': ['   MRU'] },
  \ {'type': 'bookmarks', 'header': ['   Faves'] },
\]
let g:startify_bookmarks = [
  \'~/.vimrc',
\]
let g:startify_change_to_vcs_root = 1

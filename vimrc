set nocompatible
syntax on
filetype plugin indent on

set incsearch
set hlsearch

set history=2000

set wildmenu
set wildmode=full
set nowrap

set tabstop=4
set shiftwidth=4
set expandtab

set ttimeoutlen=10

set backspace=indent,eol,start
set ruler
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg

let &g:directory=$HOME . '/.cache/vim/swap//'
if ! isdirectory(expand(&g:directory))
  silent! call mkdir(expand(&g:directory), 'p', 0700)
endif

source /usr/share/vim/vimfiles/plugin/fzf.vim

execute pathogen#infect()

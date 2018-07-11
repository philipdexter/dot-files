set nocompatible
syntax on
filetype plugin indent on

if has("persistent_undo")
    set undodir=~/.vim/undo
    set undofile
endif

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

set laststatus=2
set cursorline
set number
hi StatusLine ctermfg=140 ctermbg=0 cterm=none
hi StatusLineNC ctermfg=7 ctermbg=0 cterm=none
hi CursorLine ctermfg=none ctermbg=none cterm=none
hi ColorColumn cterm=none ctermbg=none cterm=none
hi CursorLineNr ctermfg=6 ctermbg=none cterm=none
set statusline=%F%(\ %m%)\ %{VisualPercent()}%(\ %r%)%(\ %h%)%=%{&ft}\ 



execute pathogen#infect()

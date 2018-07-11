set nocompatible
filetype plugin indent on

if has("persistent_undo")
    set undodir=~/.vim/undo
    set undofile
endif

set incsearch
set hlsearch

set smartcase
set autoindent

set history=2000

set wildmenu
set wildmode=full
set nowrap

set tabstop=2
set shiftwidth=2
set expandtab

set ttimeoutlen=10

set backspace=indent,eol,start
set ruler
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg

set list
set listchars=tab:\|\ ,trail:·

set showmode


let mapleader=","

let &g:directory=$HOME . '/.cache/vim/swap//'
if ! isdirectory(expand(&g:directory))
  silent! call mkdir(expand(&g:directory), 'p', 0700)
endif

if has("autocmd")
    autocmd!
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
    autocmd VimResized * exe "normal! \<c-w>="
endif

map <silent> <C-H> <Esc>:wincmd h<CR>
map <silent> <C-J> <Esc>:wincmd j<CR>
map <silent> <C-K> <Esc>:wincmd k<CR>
map <silent> <C-L> <Esc>:wincmd l<CR>

nmap <silent> <C-N> <Esc>:bn<CR>
nmap <silent> <C-P> <Esc>:bp<CR>

nmap <Leader>/ :nohlsearch<CR>

map Q @@
map U <C-r>
nnoremap Y y$
nnoremap ; :
imap jj <Esc>
nnoremap H ^
nnoremap L $
nnoremap K {
nnoremap J }
nnoremap ' `
nnoremap ` '
noremap { F{
noremap } f}
noremap ( F(
noremap ) f)
noremap [ F[
noremap ] f]
noremap < F<
noremap > f>



source /usr/share/vim/vimfiles/plugin/fzf.vim

syntax on

set laststatus=2
set cursorline
set number
hi StatusLine ctermfg=140 ctermbg=0 cterm=none
hi StatusLineNC ctermfg=7 ctermbg=0 cterm=none
hi CursorLine ctermfg=none ctermbg=none cterm=none
hi ColorColumn cterm=none ctermbg=none cterm=none
hi CursorLineNr ctermfg=6 ctermbg=none cterm=none
set statusline=%F%(\ %m%)\ %{VisualPercent()}%(\ %r%)%(\ %h%)%=%{&ft}\ 
hi WhitespaceEOL ctermfg=1 ctermbg=none cterm=none
match WhitespaceEOL /\s\+$/

hi Search ctermfg=none ctermbg=16 cterm=none
hi IncSearch ctermfg=1 ctermbg=16 cterm=none
hi Comment ctermfg=5 ctermbg=none cterm=none

execute pathogen#infect()

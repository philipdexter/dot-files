set nocompatible

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
set ignorecase
set smartcase
set viewoptions=folds         " only save folds with views
set foldcolumn=0              " show a fold column!
set foldtext=FoldText()       " set the collapsed fold text
set foldmethod=indent         " set automatic folding
set foldignore=               " always fold everything based on indent; don't ignore comments
set fillchars=stl:\ ,stlnc:\ ,vert:\ ,fold:\ ,diff:\  " set all fillchars to space. these are used in things like fold text.
set nofoldenable

let g:python_recommended_style = 0
let g:vimtex_view_method = 'zathura'

filetype plugin indent on

if has("persistent_undo")
    set undodir=~/.vim/undo
    set undofile
endif



let mapleader=","
let maplocalleader=","

let &g:directory=$HOME . '/.cache/vim/swap//'
if ! isdirectory(expand(&g:directory))
  silent! call mkdir(expand(&g:directory), 'p', 0700)
endif

if has("autocmd")
    autocmd!
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
    autocmd VimResized * exe "normal! \<c-w>="
    autocmd CursorHold * checktime
endif

function! FoldText()
  let line = getline(v:foldstart)
  let stripped = substitute(line, '^\s*\(.\{-}\)\s*$', '\1', '')

  let dashes = v:folddashes
  let tabbed = substitute(dashes, '-', '  ', 'g')

  let line2 = getline(v:foldend)
  let stripped2 = substitute(line2, '^\s*\(.\{-}\)\s*$', '\1', '')

  let diff = v:foldend - v:foldstart

  return tabbed . stripped . ' + ' . diff . ' more'
endfunction


map <silent> <C-H> <Esc>:wincmd h<CR>
map <silent> <C-J> <Esc>:wincmd j<CR>
map <silent> <C-K> <Esc>:wincmd k<CR>
map <silent> <C-L> <Esc>:wincmd l<CR>

nmap <silent> <C-N> <Esc>:bn<CR>
nmap <silent> <C-P> <Esc>:bp<CR>

nmap <Leader>/ :nohlsearch<CR>

nnoremap = ggVG=<C-o><C-o>
map Q @@
map U <C-r>
nnoremap Y y$
nnoremap zv za
nnoremap zV zA
nnoremap ; :
vnoremap ; :<Backspace><Backspace><Backspace><Backspace><Backspace>
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
nnoremap < F<
nnoremap > f>
vnoremap < <gv
vnoremap > >gv

nnoremap <Leader>g :exec 'cd' fnameescape(fnamemodify(finddir('.git',
    \ escape(expand('%:p:h'), ' ') . ';'), ':h'))<CR><CR>

source /usr/share/vim/vimfiles/plugin/fzf.vim
nnoremap <C-f> :Files<CR>

syntax on

set laststatus=2
set cursorline
set number
hi StatusLine ctermfg=140 ctermbg=0 cterm=none
hi StatusLineNC ctermfg=7 ctermbg=0 cterm=none
hi CursorLine ctermfg=none ctermbg=none cterm=none
hi ColorColumn cterm=none ctermbg=none cterm=none
hi CursorLineNr ctermfg=6 ctermbg=none cterm=none
set statusline=%F%(\ %m%)\ %{VisualPercent()}%(\ %r%)%(\ %h%)%=%l//%c\ \ %{&ft}\ 
hi WhitespaceEOL ctermfg=1 ctermbg=none cterm=none
match WhitespaceEOL /\s\+$/

hi Search ctermfg=none ctermbg=16 cterm=none
hi IncSearch ctermfg=1 ctermbg=16 cterm=none
hi Comment ctermfg=5 ctermbg=none cterm=none

hi Folded       ctermfg=8    ctermbg=none cterm=none
hi FoldColumn   ctermfg=7    ctermbg=none cterm=none

hi VertSplit ctermfg=0 ctermbg=0 cterm=none
hi MatchParen ctermfg=9 ctermbg=none cterm=none

hi WildMenu ctermfg=14 ctermbg=0 cterm=none

hi Visual ctermfg=none ctermbg=0 cterm=none

hi Pmenu        ctermfg=7     ctermbg=0    cterm=none
hi PmenuSel     ctermfg=6     ctermbg=0    cterm=none
hi PmenuSbar    ctermfg=7     ctermbg=7    cterm=none
hi PmenuThumb ctermfg=8 ctermbg=8 cterm=none

let g:tex_flavor = 'latex'

execute pathogen#infect()

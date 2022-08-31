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
set fillchars=stl:\ ,stlnc:\ ,vert:\ ,fold:\ ,diff:\  " set all fillchars to space. these are used in things like fold text.
set nofoldenable

set nojoinspaces

set splitbelow
set splitright

set belloff=all

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
    autocmd CursorHold * silent! checktime
endif

map <silent> <C-H> <Esc>:wincmd h<CR>
map <silent> <C-J> <Esc>:wincmd j<CR>
map <silent> <C-K> <Esc>:wincmd k<CR>
map <silent> <C-L> <Esc>:wincmd l<CR>

nmap <silent> <C-N> <Esc>:bn<CR>
nmap <silent> <C-P> <Esc>:bp<CR>

nmap <Leader>/ :nohlsearch<CR>:echo ""<CR>
nnoremap <Leader>s :set syntax=<CR>
nnoremap <Leader><Leader> :checktime<CR>
nnoremap <Leader>x :w !pbcopy<CR><CR>
nnoremap <Leader>8 :w ~/.vim/tmpfiles/=strftime("%Y-%m-%d-%H:%M:%S")<CR><CR>

nnoremap = ggVG=<C-o><C-o>
map Q @@
map U <C-r>
nnoremap Y y$
nnoremap zv za
nnoremap zV zA
nnoremap ; :
vnoremap ; :<Backspace><Backspace><Backspace><Backspace><Backspace>
inoremap jj <Esc>
" inoremap <C-d> <DEL>
nnoremap H ^
nnoremap L $
nnoremap K {
onoremap K {
nnoremap J }
onoremap J }
nnoremap ' `
nnoremap ` '
noremap ( F(
noremap ) f)
nnoremap < <<
nnoremap > >>
vnoremap < <gv
vnoremap > >gv

" spell
nnoremap z] ]s
nnoremap z[ [s

nnoremap <Leader>g :exec 'cd' fnameescape(fnamemodify(finddir('.git',
    \ escape(expand('%:p:h'), ' ') . ';'), ':h'))<CR><CR>

source /usr/local/opt/fzf/plugin/fzf.vim
nnoremap <C-f> :Files<CR>
nnoremap <C-b> :Buffers<CR>
let g:fzf_history_dir = '~/.fzfhistory'


au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

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

hi Search ctermfg=none ctermbg=8 cterm=none
hi IncSearch ctermfg=5 ctermbg=15 cterm=none
hi Comment ctermfg=5 ctermbg=none cterm=none

hi Folded       ctermfg=8    ctermbg=none cterm=none
hi FoldColumn   ctermfg=7    ctermbg=none cterm=none

hi VertSplit ctermfg=0 ctermbg=0 cterm=none
hi MatchParen ctermfg=9 ctermbg=2 cterm=none

hi WildMenu ctermfg=14 ctermbg=0 cterm=none

hi Visual ctermfg=none ctermbg=6 cterm=none

hi Pmenu        ctermfg=7     ctermbg=0    cterm=none
hi PmenuSel     ctermfg=6     ctermbg=0    cterm=none
hi PmenuSbar    ctermfg=7     ctermbg=7    cterm=none
hi PmenuThumb ctermfg=8 ctermbg=8 cterm=none

set background=dark

let g:tex_flavor = 'latex'
let g:surround_{char2nr('c')} = "\\\1command\1{\r}" " surround with latex command
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk = {'callback' : 0} " don't want em, disable the warning
let g:vimtex_indent_enabled = 0

let g:python_recommended_style = 0

let g:go_doc_keywordprg_enabled = 0

function InsertHMTime()
  :py3 import vim ; import datetime ; vim.current.line += datetime.datetime.now().strftime("%H:%M")
endfunction
:command InsertHMTime :call InsertHMTime()
function InsertYMDTime()
  :py3 import vim ; import datetime ; vim.current.line += datetime.datetime.now().strftime("%Y-%m-%d")
endfunction
:command InsertYMDTime :call InsertYMDTime()
nnoremap <Leader>D :InsertYMDTime<CR>
function InsertHeadingYMDTime()
  :py3 import vim ; import datetime ; vim.current.line += '# ' + datetime.datetime.now().strftime("%Y-%m-%d")
endfunction
:command InsertHeadingYMDTime :call InsertHeadingYMDTime()
nnoremap <Leader>H :InsertHeadingYMDTime<CR>

nmap <C-o> <Plug>EnhancedJumpsLocalOlder
nmap <C-i> <Plug>EnhancedJumpsLocalNewer
nmap g<C-o> <Plug>EnhancedJumpsOlder
nmap g<C-i> <Plug>EnhancedJumpsNewer

map <leader>r :NERDTreeFind<cr><C-l>


command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
command! -bang -nargs=* Rgn call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

nnoremap <leader>a :Rg<CR>
nnoremap <leader>AD :Rg<CR>'def\ 
nnoremap <leader>AC :Rg<CR>'class\ 
nnoremap <leader>AL :Lines<CR>

nnoremap <leader>o :GBrowse<CR>
nmap <leader>O V:GBrowse<CR>

let g:vimwiki_list = [{'path': '~/vimwiki/'}]
let g:vimwiki_list_ignore_newline = 0

let g:jedi#popup_on_dot = 0
let g:jedi#use_splits_not_buffers = "winwidth"
let g:jedi#show_call_signatures = "1"

execute pathogen#infect()

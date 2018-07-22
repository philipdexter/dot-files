set <M-o>=o
set <M-i>=i
nnoremap <buffer> <expr> <M-o> getline(line(".")) =~ "^$" ? "i%<CR>" : "o%<CR>"
nnoremap <buffer> <expr> <M-i> getline(line(".")) =~ "^$" ? "i%<Esc>O" : "O%<Esc>O"

setlocal foldmethod=expr
setlocal foldexpr=vimtex#fold#level(v:lnum)
setlocal foldtext=vimtex#fold#text()

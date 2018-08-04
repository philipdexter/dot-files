setlocal tabstop=4
setlocal shiftwidth=4
set expandtab

nnoremap <buffer> <Leader>c :make build<CR>
compiler ant

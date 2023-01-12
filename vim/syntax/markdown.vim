
" Add an item
nnoremap <Leader>.i gg/# Inbox<CR>:nohlsearch<CR>o
nnoremap <Leader>.t gg/# Today<CR>:nohlsearch<CR>o
nnoremap <Leader>.u gg/# Upcoming<CR>:nohlsearch<CR>o
nnoremap <Leader>.a gg/# Anytime<CR>:nohlsearch<CR>o
nnoremap <Leader>.s gg/# Someday<CR>:nohlsearch<CR>o

" Move an item
nnoremap <silent> <Leader>.T 0ddgg/# Today<CR>:nohlsearch<CR>p
nnoremap <silent> <Leader>.A 0ddgg/# Anytime<CR>:nohlsearch<CR>p
nnoremap <silent> <Leader>.d :let b:winview = winsaveview()<CR>0ddgg/# Done<CR>:nohlsearch<CR>pA <ESC>:InsertYMDTime<CR>A <ESC>:InsertHMTime<CR>0:call winrestview(b:winview)<CR>:unlet b:winview<CR>

" Highlight headings
hi link markdownH1 function
" Highlight days of week
syn keyword mythings MONDAY TUESDAY WEDNESDAY THURSDAY FRIDAY
hi link mythings Type

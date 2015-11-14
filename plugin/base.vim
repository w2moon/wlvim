
let g:ctrlp_max_files=0
nnoremap <leader>bm :Bookmark<cr> 
nnoremap <leader>bo :NERDTreeFind<cr>:OpenBookmark 
nnoremap <leader>fk :Ack 
"config
nnoremap <leader>ws :edit ~/.vim/bundle/wlvim/plugin/base.vim<cr>
augroup wlgroup
    autocmd!
    autocmd BufWrite base.vim :so %
augroup END

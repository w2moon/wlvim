
let g:ctrlp_max_files=0
nnoremap <leader>bm :Bookmark<cr> 
nnoremap <leader>bo :NERDTreeFind<cr>:OpenBookmark 
nnoremap <c-f> :Ack 
"config
nnoremap <leader>ws :edit ~/.vim/bundle/wlvim/plugin/base.vim<cr>
augroup wlgroup
    autocmd!
    autocmd BufWritePost base.vim :so %
augroup END


nnoremap <c-g> :call wl#test({'b':22})<cr>

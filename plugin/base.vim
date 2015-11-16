
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

" Show syntax highlighting groups for word under cursor
"nnoremap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nnoremap <c-g> :call wl#test({'b':22})<cr>

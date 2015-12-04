set fileformats=unix,dos
nnoremap <leader>bm :Bookmark<cr> 
nnoremap <leader>bo :NERDTreeFind<cr>:OpenBookmark 
nnoremap <space>F :CtrlP<cr>
nnoremap <space>f :call wl#FindFileByName(expand("<cword>"))<cr>
nnoremap <space>W :FindInFiles 
nnoremap <space>w :call wl#FindInFiles(expand("<cword>"))<cr>
nnoremap <space>d :call wl#FindInDictionary(expand("<cword>"))<cr>
command! -nargs=*  FindInFiles call wl#FindInFiles(<q-args>)
"config
nnoremap <leader>ws :edit ~/.vim/bundle/wlvim/plugin/base.vim<cr> 
inoremap jk <esc>
inoremap <esc> <nop>
set imdisable
let g:ctrlp_max_files=0
let g:ctrlp_regexp = 1
let g:ctrlp_by_filename = 0
let g:ctrlp_root_markers = ['.project']
let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'

nnoremap <space>tp :call wl#TempView("dictionary","fdfdfdfdf\nfdfdfdfj343\n")<cr>
unlet g:ctrlp_user_command
let g:ctrlp_user_command = "wllovi --method lsfiles --path %s" 
if has("gui_macvim")
    set guifont=Andale\ Mono\ Regular:h16,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
    nnoremap <space>s  :call FullScreenToggle()<cr>
    function! FullScreenToggle()
        if &fullscreen
            set nofu
        else
            set fu
        endif
    endfunction
 elseif has("win32")
    set guifont=Andale_Mono:h13,Menlo:h13,Consolas:h13,Courier_New:h13
    au GUIEnter * simalt ~x
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions-=b
    set showtabline=0
endif

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

nnoremap <leader>so :SessionOpen default<CR>

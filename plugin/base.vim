let g:ctrlp_max_files=0
set fileformats=unix,dos
nnoremap <leader>bm :Bookmark<cr> 
nnoremap <leader>bo :NERDTreeFind<cr>:OpenBookmark 
nnoremap <space>ff :Ack 
"config
nnoremap <leader>ws :edit ~/.vim/bundle/wlvim/plugin/base.vim<cr>
inoremap jk <esc>
set imdisable
let g:ctrlp_max_files=0
if has("gui_macvim")
    
    set guifont=Andale\ Mono\ Regular:h16,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
    nnoremap <space>fs  :call FullScreenToggle()<cr>
    function! FullScreenToggle()
        if &fullscreen
            set nofu
        else
            set fu
        endif
    endfunction
    let g:ctrlp_user_command =  {
                \ 'types': {
                    \ 1: ['.git', "_rb=%s/;cd $_rb;t=`git ls-files . --cached --exclude-standard --others`;for i in `grep path .gitmodules | sed %\"s/.*= //%\"`; do cd $_rb$i;t+=`git ls-files . --cached --exclude-standard --others|awk '{print %\"$i/$1%\"}'`%\"\\n%\"; done; cd $_rb;echo -e %\"$t%\""],
                    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                \ },
                \ 'fallback': g:ctrlp_user_command.fallback
            \ }
    
let lscmd = g:ctrlp_user_command.types[1][1]
echom printf(lscmd,"/Users/wp/Documents/projects/enoch")

elseif has("win32")
    au GUIEnter * simalt ~x
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

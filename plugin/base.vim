set fileformats=unix,dos
set encoding=utf-8
set termencoding=utf-8
language messages zh_CN.utf-8
nnoremap <leader>bm :Bookmark<cr> 
nnoremap <leader>bo :NERDTreeFind<cr>:OpenBookmark 
noremap <space>m :JsDoc<cr>
let g:neosnippet#snippets_directory = '~/.vim/bundle/wlvim/neosnippets/'
nnoremap <space>c :call wl#cTags(["node_modules","data"])<cr>
nnoremap <space>C :call wl#cTags([])<cr>
nnoremap <space>F :CtrlP<cr>
nnoremap <space>f :call wl#FindFileByName(expand("<cword>"))<cr>
nnoremap <space>W :FindInFiles 
nnoremap <space>w :call wl#FindInFiles(expand("<cword>"))<cr>
nnoremap <space>d :call wl#FindInDictionary(expand("<cword>"))<cr>
command! -nargs=*  FindInFiles call wl#FindInFiles(<q-args>)
nnoremap <space>o :call OpenFolder()<cr>
nnoremap <space>O :call CmdFolder()<cr>
"config
nnoremap <leader>ws :edit ~/.vim/bundle/wlvim/plugin/base.vim<cr> 
inoremap jk <esc>
inoremap <esc> <nop>
"set imdisable
let g:ctrlp_max_files=0
let g:ctrlp_regexp = 1
let g:ctrlp_by_filename = 0
let g:ctrlp_root_markers = ['.project']
let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'
"let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

map <silent> <C-e> :call g:WorkaroundNERDTreeToggle()<CR>
map <silent> <Leader>e :call g:WorkaroundNERDTreeFind()<CR>

function! g:WorkaroundNERDTreeToggle()
  try | NERDTreeToggle | catch | silent! NERDTree | endtry
endfunction


function! g:WorkaroundNERDTreeFind()
  try | NERDTreeFind | catch | silent! NERDTree | endtry
endfunction

set viminfo='100,<50,s10,h,rA:,rB:,!
autocmd VimEnter * call OpenLastSession()

function! OpenLastSession()
    if argc() == 0
        SessionOpenLast
    endif
endfunction


unlet g:ctrlp_user_command
let g:ctrlp_user_command = "wllovi --method lsfiles --path %s" 
if has("gui_macvim")
    let g:CTAGS = "/usr/local/bin/ctags"
    set guifont=Andale\ Mono\ Regular:h16,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
    nnoremap <space>s  :call FullScreenToggle()<cr>

    function! OpenFolder()
        call system('open ' . getcwd())
    endfunction


    function! CmdFolder()
        call system('open -a Terminal ' . getcwd())
    endfunction

    function! FullScreenToggle()
        if &fullscreen
            set nofu
        else
            set fu
        endif
    endfunction
 elseif has("win32")
    let g:CTAGS = "ctags"
    set guifont=Andale_Mono:h13,Menlo:h13,Consolas:h13,Courier_New:h13
    function! OpenFolder()
        call system('explorer ' . getcwd())
    endfunction

    function! CmdFolder()
        call system('start cmd ' . getcwd())
    endfunction
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

"function! InsertTabWrapper()
    "let col = col('.') - 1
    "if !col || getline('.')[col - 1] !~ '\k'
        "return "\<tab>"
    "else
        "return "\<c-p>"
    "endif
"endfunction
"inoremap <expr> <tab> InsertTabWrapper()
"inoremap <s-tab> <c-n>

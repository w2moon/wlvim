if !has('python')
    echo 'request python support'
    finish
endif

let s:plug = expand("<sfile>:p:h:h")
let s:script = s:plug . '/script/wl.py'

execute 'pyfile ' . fnameescape(s:script)
function! wl#test(o)
    echom "hello2"+a:o.b
    python makeRequest({'method':'test','path':'c:/'})
    echom s:py_result
endfunction

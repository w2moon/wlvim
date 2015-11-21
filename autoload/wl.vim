if has('python')
    let s:plug = expand("<sfile>:p:h:h")
    let s:script = s:plug . '/script/wl.py'

    execute 'pyfile ' . fnameescape(s:script)
    function! wl#test(o)
        echom "hello2"+a:o.b
        python makeRequest({'method':'test','path':'c:/'})
        echom s:py_result
    endfunction

endif

let s:lash = ctrlp#utils#lash()
fu! s:getparent(item)
	let parent = substitute(a:item, '[\/][^\/]\+[\/:]\?$', '', '')
	if parent == '' || parent !~ '[\/]'
		let parent .= s:lash
	en
	retu parent
endf

fu! s:fnesc(...)
	retu call('ctrlp#utils#fnesc', a:000)
endf

fu! s:setdir(path, ...)
	let cmd = a:0 ? a:1 : 'lc!'
	sil! exe cmd s:fnesc(a:path, 'c')
endf

fu! s:findroot(curr, mark, depth, type)
	let [depth, fnd] = [a:depth + 1, 0]
	if type(a:mark) == 1
		let fnd = s:glbpath(s:fnesc(a:curr, 'g', ','), a:mark, 1) != ''
	elsei type(a:mark) == 3
		for markr in a:mark
			if s:glbpath(s:fnesc(a:curr, 'g', ','), markr, 1) != ''
				let fnd = 1
				brea
			en
		endfo
	en
	if fnd
		cal s:setdir(a:curr) 
		retu [exists('markr') ? markr : a:mark, a:curr]
	elsei depth > 40
		cal s:setdir(s:cwd)
	el
		let parent = s:getparent(a:curr)
		if parent != a:curr
			retu s:findroot(parent, a:mark, depth, a:type)
		en
	en
	retu []
endf

fu! s:glbpath(...)
	retu call('ctrlp#utils#globpath', a:000)
endf

function! wl#Cwd2Project()
    let s:cwd = getcwd()
    let markers = ['.git','.svn']
    if type(g:ctrlp_root_markers) == 3 && !empty(g:ctrlp_root_markers)
        if s:findroot(s:cwd,g:ctrlp_root_markers,0,1) == [] 
            if s:findroot(s:cwd,markers,0,1) == []
            endif
        endif
    endif
endfunction

function! wl#FindInFiles(args)
    call wl#Cwd2Project()
    exe "Ack! ".a:args." ".getcwd()
endfunction

function! wl#FindFileByName(args)
    let g:ctrlp_default_input = a:args
    call ctrlp#init(0)
    let g:ctrlp_default_input = "0"
endfunction


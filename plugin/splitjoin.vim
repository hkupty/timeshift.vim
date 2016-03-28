function! Splitjoin_split(type, ...) abort
  let save = @@
  let save_s = @s
  if a:type == 'line'
    let command = "'[V']"
  else
    if a:0
      let command = '`]ms`["sy$j0v`s'
    else
      let command = "`[v`]"
    endif
  endif
  exec 'normal '.command.'dms'
  let cbuff = bufnr('%')
  if a:0
    let cft = @s
    let cmdtype = 'line'
  else
    let cft = &ft
    let cmdtype = a:type
  endif
  vnew
  let b:retbuff = cbuff
  let b:commandtype = cmdtype
  exec 'set filetype='.cft
  normal Vp
  nnoremap <buffer> q :call Splitjoin_join()<CR>
endfunction

function! Splitjoin_join() abort
  normal gg0vG$d
  if b:commandtype == 'line'
    let paste = "'sP"
  else
    let paste = "\`sp"
  endif
  let cbuff = b:retbuff
  bd! %
  normal <C-w>q
  exec 'buffer '.cbuff
  exec 'normal '.paste
endfunction

function! Splitjoin_inner_markdown(type) abort
  ?`
  normal k
  call Splitjoin_split(a:type, 1)
endfunction

autocmd FileType markdown nmap <buffer> gx :set opfunc=Splitjoin_inner_markdown<CR>g@i`
nmap <silent> gx :set opfunc=Splitjoin_split<CR>g@

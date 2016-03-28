function! Splitjoin_split(type) abort
  if a:type == 'line'
    let command = "'[V']d"
  else
    let command = "`[v`]d"
  endif
  exec 'normal '.command
  normal ms
  let cbuff = bufnr('%')
  let cft = &ft
  vnew
  let b:retbuff = cbuff
  let b:commandtype = a:type
  exec 'set filetype='.cft
  normal Vp
  nnoremap <buffer> q :call Splitjoin_join()<CR>
endfunction

function! Splitjoin_join() abort
  if b:commandtype == 'line'
    let paste = "'sP"
    normal ggVGd
  else
    let paste = "\`sp"
    normal 0v$d
  endif
  let cbuff = b:retbuff
  bd! %
  normal <C-w>q
  exec 'buffer '.cbuff
  echomsg "".paste
  exec 'normal '.paste
endfunction

nmap <silent> gx :set opfunc=Splitjoin_split<CR>g@

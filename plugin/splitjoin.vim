function! Splitjoin_split() abort
  normal dip
  normal ms
  let cbuff = bufnr('%')
  let cft = &ft
  vnew
  let b:retbuff = cbuff
  exec 'set filetype='.cft
  normal p
  nnoremap <buffer> q :call Splitjoin_join()<CR>
endfunction

function! Splitjoin_join() abort
  normal ggDG
  let cbuff = b:retbuff
  bd! %
  normal <C-w>q
  exec 'buffer '.cbuff
  normal 'sP
endfunction

map <leader>s :call Splitjoin_split()<CR>

nno <silent> + <cmd>set opfunc=Align<cr>g@

function! Align(mode)
  let l:chr=getcharstr()
  let g:aligncol=0
  '[,']call Align_GetCol(l:chr)
  exec "'[,']norm! f".l:chr."20i ".g:aligncol."|dw"
endfunction

function! Align_GetCol(chr)
  exec 'norm f'.a:chr
  let l:pos=col('.')
  if g:aligncol < l:pos
    let g:aligncol=l:pos
  endif
endfunction

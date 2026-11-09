"
"  align.vim
"  Author: Christian Doolittle
"  Created: 12-Jun-2025
"  Modified: 16-Jul-2026
"  Vertically align segments of text by a given character.
"

function! s:align(_)
  let l:char = nr2char(getchar())
  let s:aligncol = 0
  '[,']call s:findcol(l:char)
  exec "'[,']norm! ".v:count."f".l:char.s:aligncol."i \<esc>".s:aligncol."|dw"
endfunction

function! s:findcol(char)
  exec "norm! ".v:count."f".a:char
  let l:col = col(".")
  if (l:col > s:aligncol)
    let s:aligncol = l:col
  endif
endfunction

noremap <silent> <Plug>Align <cmd>set opfunc=<SID>align<cr>g@

if !(exists("g:align_no_mappings") && g:align_no_mappings)
  nmap + <Plug>Align
  xmap + <Plug>Align
endif

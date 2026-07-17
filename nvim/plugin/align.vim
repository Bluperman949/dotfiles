"
"  align.vim
"  Author: Christian Doolittle
"  Created: 12-Jun-2025
"  Modified: 16-Jul-2026
"  Vertically align segments of text by a given character.
"

function! s:getaligncol(char)
  exec "norm! ".1."f".a:char
  return col(".")
endfunction

function! s:align(_)
  let l:char = nr2char(getchar())
  let l:maxcol = 0
  '[,']let l:maxcol = max([l:maxcol, s:getaligncol(l:char)])
  exec "'[,']norm! ".1."f".l:char."64i \<esc>".l:maxcol."|dw"
endfunction

noremap <silent> <Plug>Align <cmd>set opfunc=<SID>align<cr>g@

if !(exists("g:align_no_mappings") && g:align_no_mappings)
  nmap + <Plug>Align
  xmap + <Plug>Align
endif

"
"  keybinds.vim
"  Author: Christian Doolittle
"  Created: 20-Sep-2024
"  A completely unorganized set of bindings that tie together my nvim setup.
"

" first bind I ever wrote... colon is annoying
no <Space> :

" write (update) easily
nno <A-e> :up<cr>
nno <C-s> :up<cr>
ino <A-e> <esc>:up<cr>

" hey guys, how do I exit vim?
nno <A-q> <cmd>q<cr>
nno zq <cmd>q<cr>

" easy restart for testing
nno <bslash>r <cmd>restart<cr>

" toggle text display options with 'z'
nno z<space> <cmd>set list!\|set list?<cr>
nno zw <cmd>set wrap!\|set wrap?<cr>

" nohlsearch easily
nno zl <cmd>nohlsearch<cr>

" easier home/end wth H/L
map H ^
map L $
sunm H
sunm L

" make old H/L accessible
no gH H
no gL L
sunm gH
sunm gL

" easier scrolling
nno <C-j> <C-e>
nno <C-k> <C-y>

nno ( <scrollwheelleft>
nno ) <scrollwheelright>

" match window navigation to my WM's binds, WASD-style
nno <A-a> <C-w>h
nno <A-s> <C-w>j
nno <A-w> <C-w>k
nno <A-d> <C-w>l

nno <A-A> <C-w>H
nno <A-S> <C-w>J
nno <A-W> <C-w>K
nno <A-D> <C-w>L

" easily resize windows
nno <A-,> <C-w><
nno <A-.> <C-w>>
nno <A--> <C-w>-
nno <A-=> <C-w>+

" press 'q' to exit help pages without accidentally closing my main window
autocmd BufWinEnter *.txt exec
  \ "if &l:buftype ==# 'help' | nno <buffer> q <cmd>q<cr> | endif"

" I don't use select mode - replace with vim-surround
map s ys
map S yS
sunm s
sunm S

" unmap default lsp binds
try
  xunmap gra
  nunmap gra
  nunmap gri
  nunmap grr
  nunmap grn
  nunmap grt
  nunmap grx
catch /No such mapping/
endtry

" inspect ASCII (default conflicts with LSP binds)
nno <C-a><C-a> ga
" inspect highlight
nno <C-a><C-h> <cmd>Inspect<cr>

" move lines up and down, vscode-style
nno <A-j> <cmd>m+1<cr>
nno <A-k> <cmd>m-2<cr>

" quick find+replace, vscode-style
nno <F2> "ryiw:%s/<C-r>r//g<left><left>
vno <F2> "ry:%s/<C-r>r//g<left><left>

" redo is the opposite of undo
nmap U <C-r>

" auto markdown code block, immune to autopairs
ino `` ```<cr>```<up><end>

" replace word (eg. a big indent) with space
nno c<space> ciw<space><esc>

" save my finger when typing '%'
no <A-r> %
ino <A-r> %
sunm <A-r>

" change a file with 4-space indentation to 2-space
nno <C-S-i> <cmd>%s/    /  /g<cr><cmd>nohlsearch<cr>

" close all non-active buffers
nno <F9> <cmd>call ClearBufs()<cr>
function! ClearBufs()
  let bufs = nvim_list_bufs()
  for bufnr in bufs
    if bufwinnr(bufnr) == -1
      execute('bw '.bufnr)
    endif
  endfor
endfunction

"
"  keybinds.vim
"  Author: Christian Doolittle
"  A completely unorganized set of bindings that tie together my nvim setup.
"

" first bind I ever wrote... colon is annoying
no <Space> :

" write (update) easily
nno <A-e> :up<cr>
nno <C-s> :up<cr>
ino <A-e> <esc>:up<cr>

" hey guys, how do I exit vim?
nno <A-q> :q<cr>

" lsp debugging stuff
nno ,; <cmd>lua require'jdtls'.start_or_attach(require'my.jdtls-config')<cr>
nno ,l <cmd>LspInfo<cr>

" fold blocks easily
nno zff zfaB

" toggle invis chars + wrapping with 't'
nno ts <cmd>set list!<cr>
nno tw <cmd>set wrap!<cr>

" nohlsearch with F4
nno <F4> <cmd>nohlsearch<cr>

" easier home/end wth H/L/;
imap <A-;> <end>
map H ^
map L $
map gL g$
sunm H
sunm L
sunm gL

" easier scrolling
nno J <C-e>
nno K <C-y>

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

" plugin screens
nno \\   <cmd>Lazy<cr>
nno \|\| <cmd>Mason<cr>
nno - <cmd>Oil<cr>

" unmap default lsp binds
try
  xunmap gra
  nunmap gra
  nunmap gri
  nunmap grr
  nunmap grn
catch /No such mapping/ | endtry

" move lines up and down, vscode-style
nno <A-j> <cmd>m+1<cr>
nno <A-k> <cmd>m-2<cr>

" quick find+replace, vscode-style
nno <F2> "ryiw:%s/<C-r>r//g<left><left>
vno <F2> "ry:%s/<C-r>r//g<left><left>

" expand/minify curly-brace one-liners
nno m1 vaBJ
nno m2 $hr<cr>%lr<cr>$

" make Join accessible (J is remapped above)
nno <C-j> J

" redo is the opposite of undo
nmap U <C-r>

" auto markdown code block, immune to autopairs
ino `` ```<cr>```<up><end>

" autopairs-immune quotes
ino <A-'> '
ino <A-S-'> "

" replace word (eg. a big indent) with space
nno c<space> ciw<space><esc>

" save my finger when typing '%'
no <A-r> %
ino <A-r> %
sunm <A-r>

" write escape character
ino <A-[> <C-v><esc>

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

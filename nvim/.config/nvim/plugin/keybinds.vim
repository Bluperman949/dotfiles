"
"  keybinds.vim
"  Author: Christian Doolittle
"

"misc
no <Space> :

nno <A-e> :w<cr>
nno <C-s> :w<cr>
ino <A-e> <esc>:w<cr>

nno <C-S-b> <cmd>term cat ~/Documents/ref/chars.txt<cr>
nno <C-S-w> <cmd>set wrap!<cr>
nno ,; <cmd>lua require'jdtls'.start_or_attach(require'my.jdtls-config')<cr>

nno zff zfaB

"text browsing
nno <F4> <cmd>nohlsearch<cr>
nno <C-j> <nop>

ino <A-;> <end>
no H ^
no J L
no K H
no L $
no gL g$
no <A-r> %
sunm H
sunm J
sunm K
sunm L
sunm gL
sunm <A-r>

nno w E
vno w E
nno W B
vno W B
nno e e
vno e e
nno E b
vno E b

vno n <esc><cmd>call search('\w')<cr>viw
vno N o<esc><cmd>call search('\w','b')<cr>viw

nno ) <scrollwheelright>
nno ( <scrollwheelleft>

"window/file browsing
nno <A-q> <cmd>q<cr>
nno <S-A-q> <cmd>q!<cr>
nno <a-v>d <cmd>vs<cr>

nno <A-a> <C-w>h
nno <A-s> <C-w>j
nno <A-w> <C-w>k
nno <A-d> <C-w>l

nno <A-A> <C-w>H
nno <A-S> <C-w>J
nno <A-W> <C-w>K
nno <A-D> <C-w>L

nno <A-,> <C-w><
nno <A-.> <C-w>>
nno <A--> <C-w>-
nno <A-=> <C-w>+

autocmd BufWinEnter *.txt exec
  \ "if &l:buftype ==# 'help' | nno <buffer> q <cmd>q<cr> | endif"

"plugin integration
map s ys
map S yS
sunmap s
sunmap S

nno \\   <cmd>Lazy<cr>
nno \|\| <cmd>Mason<cr>
nno - <cmd>Oil<cr>

nno n <nop>
nno N <nop>
nno nf n
nno bf N

try
  xunmap gra
  nunmap gra
  nunmap gri
  nunmap grr
  nunmap grn
catch /No such mapping/ | endtry

"text editing
nno <A-j> <cmd>m+1<cr>
nno <A-k> <cmd>m-2<cr>
nno <F2> "ryiw:%s/<C-r>r//g<left><left>
vno <F2> "ry:%s/<C-r>r//g<left><left>

nno mj A,<cr>
nno ml A,<left><cr>
no mk J
sunmap mk
nno m1 vaBJ
nno m2 $<left>r<cr>%<right>r<cr>$

nmap yaa ggyG
nmap daa ggdG

nmap U <C-r>

ino <C-;> <end>;
ino <A-'> '
ino <A-S-'> "
nno c<space> ciw<space><esc>

ino <A-9> §
ino <A-0> °
ino <A-r> %
ino <A-s> <backspace>
ino <A-d> <del>

nno <C-S-i> <cmd>%s/    /  /g<cr><cmd>nohlsearch<cr>

nmap gm gc
nmap gmm gcc

"functions
nno <F9> <cmd>call ClearBufs()<cr>
function! ClearBufs()
  let bufs = nvim_list_bufs()
  for bufnr in bufs
    if bufwinnr(bufnr) == -1
      execute('bw '.bufnr)
    endif
  endfor
endfunction

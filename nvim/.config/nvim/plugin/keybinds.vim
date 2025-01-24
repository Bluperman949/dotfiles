"
"  keybinds.vim
"  Author: Christian Doolittle
"

"misc
no <Space> :
no <A-e> :w<cr>
ino <A-e> <esc>:w<cr>
no <C-S-w> <cmd>set wrap!<cr>
no <C-S-b> <cmd>term cat ~/Documents/ref/chars.txt<cr>

"text browsing
no <F4> <cmd>nohlsearch<cr>
no <C-j> <nop>

no H ^
no J }
no K {
no L g$
ono L $

no <A-r> %

nno w El
vno w El
nno W Bh
vno W Bh
nno e el
vno e el
nno E bh
vno E bh

"window/file browsing
no <F9> <cmd>call ClearBufs()<cr>

no <A-q> <cmd>q<cr>
no <S-A-q> <cmd>q!<cr>
no <a-v>d <cmd>vs<cr>

no <A-A> <C-w>H
no <A-S> <C-w>J
no <A-W> <C-w>K
no <A-D> <C-w>L

no <A-,> <C-w><
no <A-.> <C-w>>

no <A-t> <cmd>tabnew %<cr>
no <C-tab> gt

no <A-h> <C-o>
no <A-l> <C-i>

"plugin integration
map s ys
map S yS

no \\   <cmd>Lazy<cr>
no \|\| <cmd>Mason<cr>
no - <cmd>Oil<cr>

"text editing
nno <A-j> <cmd>m+1<cr>
nno <A-k> <cmd>m-2<cr>
nno <C-S-j> A,<cr>
nno <C-S-k> j<cmd>s/^ */<cr><cmd>nohl<cr>i<backspace>
nno <F2> "ryiw:%s/<C-r>r//g<left><left>
vno <F2> "ry:%s/<C-r>r//g<left><left>

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

"functions
function! ClearBufs()
  let bufs = nvim_list_bufs()
  for bufnr in bufs
    if bufwinnr(bufnr) == -1
      execute('bw '.bufnr)
    endif
  endfor
endfunction

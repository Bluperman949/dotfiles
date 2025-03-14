"
"  keybinds.vim
"  Author: Christian Doolittle
"

"misc
no <Space> :
no <A-e> :w<cr>
ino <A-e> <esc>:w<cr>
nno <C-S-w> <cmd>set wrap!<cr>
nno <C-S-b> <cmd>term cat ~/Documents/ref/chars.txt<cr>

nno ,; <cmd>lua require'jdtls'.start_or_attach(require'my.jdtls-config')<cr>

"text browsing
nno <F4> <cmd>nohlsearch<cr>
nno <C-j> <nop>

no H ^
sunm H
no J 10j
sunm J
no K 10k
sunm K
no L $
sunm L
no gL g$
sunm gL

ino <A-;> <end>

no <A-r> %
sunm <A-r>

nno w E
vno w E
nno W B
vno W B
nno e e
vno e e
nno E b
vno E b

nno ) <scrollwheelright>
nno ( <scrollwheelleft>

"window/file browsing
nno <F9> <cmd>call ClearBufs()<cr>

nno <A-q> <cmd>q<cr>
nno <S-A-q> <cmd>q!<cr>
nno <a-v>d <cmd>vs<cr>

nno <A-A> <C-w>H
nno <A-S> <C-w>J
nno <A-W> <C-w>K
nno <A-D> <C-w>L

nno <A-,> <C-w><
nno <A-.> <C-w>>
nno <A--> <C-w>-
nno <A-=> <C-w>+

nno <A-t> <cmd>tabnew %<cr>
nno <C-tab> gt

autocmd BufWinEnter *.txt if &l:buftype ==# 'help'
  \|nno <buffer> q <cmd>q<cr> | endif

"plugin integration
map s ys
map S yS
sunmap s
sunmap S

nno \\   <cmd>Lazy<cr>
nno \|\| <cmd>Mason<cr>
nno - <cmd>Oil<cr>

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

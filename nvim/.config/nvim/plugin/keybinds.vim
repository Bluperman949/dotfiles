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

no H 0
no 0 ^
no J }
no K {
no L 078l
ono L $
ino <A-l> <esc>l
ino <A-j> <esc>j
ino <A-k> <esc>k
ino <A-h> <esc>h

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
no <F10> <cmd>tabnew %<cr><cmd>ball<cr>

no <A-q> <cmd>q<cr>
no <S-A-q> <cmd>q!<cr>
no <a-v>d <cmd>vs<cr>

no <A-a> <C-w>h
no <A-s> <C-w>j
no <A-w> <C-w>k
no <A-d> <C-w>l
no <A-A> <C-w>H
no <A-S> <C-w>J
no <A-W> <C-w>K
no <A-D> <C-w>L

no <A-,> <C-w><
no <A-.> <C-w>>

no <A-t> <cmd>tabnew %<cr>
no <C-A-a> gT
no <C-A-d> gt

no <A-h> <C-o>
no <A-l> <C-i>

"plugin integration
no <C-o> <cmd>Files<cr>
no <C-A-f> <cmd>Lines<cr>
no <C-f> <cmd>BLines<cr>
map t <nop>
no to <cmd>NvimTreeToggle<cr>
no tt <cmd>Trouble focus<cr>
no tq <cmd>Trouble close<cr>
no tp <cmd>Trouble diagnostics<cr>
no tr <cmd>Trouble lsp_references<cr>
no tf <cmd>Trouble quickfix<cr>
nmap s ys

"text editing
nn <A-j> <cmd>m+1<cr>
nn <A-k> <cmd>m-2<cr>
no <C-S-j> A,<cr>
no <C-S-k> j<cmd>s/^ */<cr><cmd>nohl<cr>i<backspace>
no <F2> "ryiw:%s/<C-r>r//g<left><left>
vno <F2> "ry:%s/<C-r>r//g<left><left>

ono q "
nmap yaa ggyG
nmap U <cmd>redo<cr>

ino <A-s> <backspace>
ino <A-x> <del>
ino <C-;> <end>;
ino <A-'> '
ino <A-S-'> "

"functions
function! ClearBufs()
  let bufs = nvim_list_bufs()
  for bufnr in bufs
    if bufwinnr(bufnr) == -1
      execute('bw '.bufnr)
    endif
  endfor
endfunction

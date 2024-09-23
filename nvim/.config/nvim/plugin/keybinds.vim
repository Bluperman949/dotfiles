"misc
no <Space> :
no <A-e> :w<CR>

"text browsing
no <F4> :nohlsearch<CR>
no <C-j>
no L $
no H 0
no J }
no K {
no E b

"window/file browsing
no <F9> :call ClearBufs()<CR>
no <F10> :tabnew %<CR>:ball<CR>

no <A-CR> <C-w>v<C-w>l
no <A-q> <C-w>c
no <C-q> :qa<CR>
no <C-s-q> :q!<CR>
no <C-A-q> <nop>

no <A-a> <C-w>h
no <A-s> <C-w>j
no <A-w> <C-w>k
no <A-d> <C-w>l
no <A-A> <C-w>H
no <A-S> <C-w>J
no <A-W> <C-w>K
no <A-D> <C-w>L

no <A-t> :tabnew %<CR>
no <C-A-a> gT
no <C-A-d> gt

no <A-h> <C-o>
no <A-l> <C-i>

"plugin integration
no <C-o> :Files<CR>
no <C-A-f> :Lines<CR>
no <C-f> :BLines<CR>
no t :NvimTreeFocus<CR>

"text editing
nn <A-j> :m+1<CR>
nn <A-k> :m-2<CR>
"no <F2> "ryiw:%s/<C-r>r//g<Left><Left>
"vno <F2> "ry:%s/<C-r>r//g<Left><Left>
nmap ciq ci"
nmap diq di"
nmap U <C-r>

"easy brackets
"ino { {}<Left>
"ino [ []<Left>
"ino ( ()<Left>
"ino < <><Left>
"ino <expr> ] TestCurChar(']') ? "<Right>" : "]"
"ino <expr> ) TestCurChar(')') ? "<Right>" : ")"
"ino <expr> > TestCurChar('>') ? "<Right>" : ">"
"ino <C-'> '
"ino <expr> ' TestCurChar("\'") ? "<Right>" : "\'\'<Left>"
"ino <C-S-'> "
"ino <expr> " TestCurChar("\"") ? "<Right>" : "\"\"<Left>"
"ino <expr> <CR> TestCurChar('})]') ? "<CR><Esc>%a<CR><Tab><End>" : "<CR>" 
ino <A-S-,> </

"functions
function! TestCurChar(sample)
  return matchstr(a:sample, '['.getline('.')[col('.')-1].']') != ""
endfunction
function! ClearBufs()
  let bufs = nvim_list_bufs()
  for bufnr in bufs
    if bufwinnr(bufnr) == -1
      execute("bw ".bufnr)
    endif
  endfor
endfunction

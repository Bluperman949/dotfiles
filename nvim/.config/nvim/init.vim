"colors
set termguicolors
colorscheme gruvbox

"UI changes
set relativenumber

"clipboard
set clipboard+=unnamedplus

"tabs
set tabstop=2
set shiftwidth=2
set expandtab

"basic keybinds
no <Space> :
no <C-q> :q<CR>
no <C-s> :w<CR>
no <F4> :nohlsearch<CR>
nn <A-j> :m+1<CR>
nn <A-k> :m-2<CR>
no <C-j>
no L $
no H 0
no J }
no K {
no <Enter> :call cursor(0, virtcol('$')/2)<CR>
nmap ciq ci"
nmap diq di"

"file browsing
no <C-p> :call fzf#run(fzf#wrap())<CR>

"easy brackets
ino { {}<Left>
ino [ []<Left>
ino ( ()<Left>
ino < <><Left>
ino <expr> } TestCurChar('}') ? "<Right>" : "}"
ino <expr> ] TestCurChar(']') ? "<Right>" : "]"
ino <expr> ) TestCurChar(')') ? "<Right>" : ")"
ino <expr> > TestCurChar('>') ? "<Right>" : ">"
ino <expr> ' TestCurChar("\'") ? "<Right>" : "\'\'<Left>"
ino <expr> " TestCurChar("\"") ? "<Right>" : "\"\"<Left>"
ino <expr> <CR> TestCurChar('})]') ? "<CR><Esc>%a<CR><Tab><End>" : "<CR>" 

"renaming
no <F2> "ryiw:%s/<C-r>r//g<Left><Left>
vno <F2> "ry:%s/<C-r>r//g<Left><Left>

"functions
function TestCurChar(sample)
  return matchstr(a:sample, '['.getline('.')[col('.')-1].']') != ""
endfunction

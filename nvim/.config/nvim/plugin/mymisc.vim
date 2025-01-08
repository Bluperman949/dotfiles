"
"  mymisc.vim
"

set tabstop=2
set shiftwidth=2
set expandtab

set termguicolors
let g:c_syntax_for_h=1
colorscheme gruvbox

set relativenumber
set colorcolumn=80,120
set cursorline
set numberwidth=2
set signcolumn=no
set linebreak
set nowrap

set clipboard=unnamedplus

augroup mymisc
  autocmd!
  au ColorScheme gruvbox hi Folded gui=italic guibg=#282828
  au WinEnter *.* if winwidth('.')<82 | exe 'norm 82|' | endif
augroup END

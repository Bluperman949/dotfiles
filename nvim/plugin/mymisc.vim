"
"  mymisc.vim
"

set tabstop=2
set shiftwidth=2
set expandtab
set listchars=tab:»\ ,eol:󰌑,space:·

set termguicolors
let g:c_syntax_for_h=1

set signcolumn=yes:1

set relativenumber
set number
set colorcolumn=80
set textwidth=79
set cursorline
set numberwidth=2
set linebreak
set nowrap
set splitright

set clipboard=unnamedplus

augroup mymisc
  autocmd!
  au WinEnter *.* if winwidth('.')<82 | exe 'norm 82|' | endif
  au TermOpen term://* startinsert
augroup END

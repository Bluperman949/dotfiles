"
"  mymisc.vim
"

set tabstop=2
set shiftwidth=2
set expandtab

set termguicolors

set relativenumber
set colorcolumn=80,120
set cursorline
set numberwidth=2
set signcolumn=no
set nowrap

set clipboard=unnamedplus

augroup mymisc
  autocmd!
  au ColorScheme gruvbox hi Folded gui=italic guibg=#282828
  au WinEnter * if winwidth('.')<82 | exe 'norm 82|' | endif
augroup END

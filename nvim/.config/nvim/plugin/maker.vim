"
"  maker.vim
"  Author: Christian Doolittle
"  Created: 16-Oct-2024
"

augroup Maker
  autocmd!
  au BufWinEnter,BufReadPost * let b:makestr='make'
  au BufWinEnter,BufReadPost *.zig,*.zon let b:makestr='zig build run'
  au BufWinEnter,BufReadPost *.r let b:makestr='Rscript %'
  au BufWinEnter,BufReadPost *.py call FindMakefileElse('python %')
augroup END

function! FindMakefileElse(fallback)
  if filereadable('makefile')
    let b:makestr='make'
  else
    let b:makestr=a:fallback
  endif
endfunction

function! MakerToggleSilent()
  let g:makesilent=!g:makesilent
  if g:makesilent
    command! Make exec 'silent !'.b:makestr
  else
    command! Make exec 'silent !kitty --hold --class=runner -1 '.b:makestr
  endif
endfunction

let g:makesilent=1
call MakerToggleSilent()

no ,, <cmd>w<cr>
no ,. <cmd>w<cr><cmd>Make<cr>
no ,s <cmd>call MakerToggleSilent()<cr>

"
"  maker.vim
"  Author: Christian Doolittle
"  Created: 16-Oct-2024
"

augroup Maker
  autocmd!
  au BufWinEnter,BufReadPost * let b:makestr="make"
  au BufWinEnter,BufReadPost *.zig,*.zon let b:makestr="zig build run"
  au BufWinEnter,BufReadPost *.py let b:makestr="python %"
augroup END

let g:termcmd='silent !kitty --hold --class=runner -1'
" `runner` window class is customized in i3wm config.

function! Make()
  exec g:termcmd.' '.b:makestr
  echo 'Make()'
endfunction

no <A-r> <cmd>call Make()<CR>

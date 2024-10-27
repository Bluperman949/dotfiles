"
" AlAsm filetype plugin file, alasm.vim
" Language:	alasm
" Maintainer:	Christian Doolittle
" Created: 11-Oct-2024
"

au! BufRead,BufNewFile *.alasm setfiletype alasm

if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1

setlocal commentstring=#%s

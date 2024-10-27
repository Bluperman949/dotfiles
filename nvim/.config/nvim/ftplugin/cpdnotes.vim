"
" CPD-Notes filetype plugin file, cpdnotes.vim
" Language:	cpdnotes
" Maintainer:	Christian Doolittle
" Created: 14-Oct-2024
"

if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1

setlocal conceallevel=2
setlocal spell
setlocal foldmethod=indent

" three asterisk separator between sections
no <C-m> 4o<esc>kk37i<space><esc>a***<esc>2j

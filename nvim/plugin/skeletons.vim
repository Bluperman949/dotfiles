"
"  skeletons.vim
"  Author: Christian Doolittle
"  Created: 12-Nov-2024
"
"  This allows me to specify skeleton files for any language. These files
"  have access to commonly-used header information (name, date, etc.).
"  I'm tired of copying the same template file 20 times, and Java was the
"  final push for me to make this script.
"

"change this line per-branch for now, idk how to relative-reference viml
let g:skeldir='~/.config/nvim/skeleton'

"All skeletons have access to:
"  {NAME}: filename with no extension
"  {FILE}: filename
"  {DATE}: formatted date, e.g. '18-Jul-2024'
function! Skeleton(skeltype)
  "paste skeleton file
  exec '%!cat '.g:skeldir.'/skeleton.'.a:skeltype

  let l:filename=expand('<afile>')
  let l:progname=fnamemodify(l:filename, ':r')

  sil! exec '%s/{FILE}/'.l:filename.'/g'
  sil! exec '%s/{NAME}/'.l:progname.'/g'
  sil! exec '%s/{DATE}/'.system('date +%d-%b-%Y')[0:-2].'/g'
endfunction

"Skeleton() wrapper with added field:
"  {PKG}:  java-style package, e.g. 'com.google.code.gson'
"          root is '<dir above with buildscript>/src/'
function! SkeletonJava()
  call Skeleton('java')
  exec "lua vim.g.root = vim.fs.root(0, {'makefile', '.git'})"
  let l:pkg=expand('<amatch>')
  let l:pkg=substitute(l:pkg, '\/', '.', 'g')
  exec '%s/{PKG}/'.l:pkg.'/g'
  unlet g:root
endfunction

augroup Skeletons
  autocmd!
  au BufNewFile *.py   call Skeleton('py')
  au BufNewFile *.sh   call Skeleton('sh')
  " au BufNewFile *.java call SkeletonJava()
augroup END

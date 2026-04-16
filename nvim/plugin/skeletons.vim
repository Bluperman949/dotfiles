"
"  skeletons.vim
"  Author: Christian Doolittle
"  Created: 12-Nov-2024
"  Modified: 15-Apr-2026
"
"  This allows me to specify skeleton files for any language. These files
"  have access to commonly-used header information (name, date, etc.).
"  I'm tired of copying the same template file 20 times, and Java was the
"  final push for me to make this script.
"
"  Edit as of 15-Apr-2026: Not worth it for Java. I'm deleting the Java
"  skeleton. Just keeping this around for scripting languages.
"

"change this line per-branch for now, idk how to relative-reference viml
let g:skeldir='~/.config/nvim/skeleton'

"All skeletons have access to:
"  {FILE}: filename
"  {NAME}: filename with no extension
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

augroup Skeletons
  autocmd!
  au BufNewFile *.py   call Skeleton('py')
  au BufNewFile *.sh   call Skeleton('sh')
  au BufNewFile *.php  call Skeleton('php')
  au BufNewFile *.html call Skeleton('html')
augroup END

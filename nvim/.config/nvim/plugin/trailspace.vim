"
"  trailspace.vim
"  Author: Christian Doolittle
"  Created: 12-Nov-2024
"

hi link trailingWhitespace Error
call matchadd('trailingWhitespace', '\s\+\(\%#\)\@!$')

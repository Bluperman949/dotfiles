"
"  trailspace.vim
"  Author: Christian Doolittle
"  Created: 12-Nov-2024
"  Modified: 27-Apr-2026
"

match trailingWhitespace /\s\+\%#\@<!$/
au! ColorScheme * hi link trailingWhitespace DiagnosticUnderlineWarn
hi link trailingWhitespace DiagnosticUnderlineWarn

"
" mshapes.vim
" Author: Christian Doolittle
" Created: 15-Jun-2026
" Keybinds for common code-restructuring actions.
"

" expand/minify curly-brace one-liners (make-one-line, make-two-lines)
nno m1 va{J
nno m2 ysi{<C-j>=a{

" turn a one-liner into a curly-brace block
" TODO: doesn't work rn
nno mB 0f(%lr<cr>ySS{kJ

" make a doc comment above the current line
nno mD O**/<esc>O/**<cr>

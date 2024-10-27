"
" AlAsm syntax file, alasm.vim
" Maintainer: Christian Doolittle
" Created: 11-Oct-2024
"

if exists('b:current_syntax') | finish | endif


sy match alasmRegister  '\u\+'    nextgroup=alasmErrorAlways contained
hi link  alasmRegister  Identifier
sy match alasmAddress   '\d\+'    nextgroup=alasmErrorAlways contained
hi link  alasmAddress   Number

sy match alasmData      '^\d\+'   nextgroup=alasmFraction,alasmErrorFraction
hi link  alasmData      String
sy match alasmFraction  '\/'      nextgroup=alasmDivisor     contained
hi link  alasmFraction  alasmPreProc
sy match alasmDivisor   '\d\+'    nextgroup=alasmErrorAlways contained
hi link  alasmDivisor   String

sy match alasmLabel     '\h\+'    nextgroup=alasmErrorAlways contained
hi link  alasmLabel     Function

sy match alasmOpLink    '^\~'     nextgroup=alasmRegister,alasmErrorRegister
hi link  alasmOpLink    Operator
sy match alasmOpHead    '^@'      nextgroup=alasmAddress,alasmErrorAddress
hi link  alasmOpHead    Operator
sy match alasmOpHead    '^>'      nextgroup=alasmAddress,alasmLabel,alasmErrorLabel
hi link  alasmOpHead    Operator

sy match alasmOpTorque  '^[RW]'   nextgroup=alasmErrorAlways
hi link  alasmOpTorque  Statement
sy match alasmOpHeadEnd '^>>'     nextgroup=alasmErrorAlways
hi link  alasmOpHeadEnd Statement

sy match alasmComment   '^#.*$'
hi link  alasmComment   Comment
sy match alasmPreProc   '^!\/\@=' nextgroup=alasmFraction,alasmErrorFraction
sy match alasmPreProc   '^!\.'    nextgroup=alasmLabel
hi link  alasmPreProc   PreProc

sy match alasmError     '^[^@>RW~#!0-9].*$'
sy match alasmError     '[@>~]$'
sy match alasmError     '^![^./].*$'
hi link  alasmError     Error

sy match alasmErrorRegister   '\U.*$'    contained
hi link  alasmErrorRegister   alasmError
sy match alasmErrorAddress    '\D.*$'    contained
hi link  alasmErrorAddress    alasmError
sy match alasmErrorLabel      '\W.*$'    contained
hi link  alasmErrorLabel      alasmError
sy match alasmErrorFraction   '[^\/].*$' contained
sy match alasmErrorFraction   '\/\D.*$'  contained
hi link  alasmErrorFraction   alasmError
sy match alasmErrorAlways     '.\+$'     contained
hi link  alasmErrorAlways     alasmError


let b:current_syntax = 'alasm'

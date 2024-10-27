"
" CPD-Notes syntax file, cpdnotes.vim
" Language:	cpdnotes
" Maintainer:	Christian Doolittle
" Created: 14-Oct-2024
"


sy match cpdnBackslash '\\\([*_\\]\)\@=' conceal
sy cluster cpdnFormatters contains=cpdnItalic,cpdnUnderline,cpdnBackslash

sy match cpdnItalicDelimiter '\(\\\)\@<!\*' contained conceal cchar= 
sy region cpdnItalic start='\(\\\)\@<!\*' end='\*' skip='\\\*' keepend
      \ contains=@cpdnFormatters,cpdnItalicDelimiter

sy match cpdnUnderlineDelimiter '\(\\\)\@<!_' contained conceal cchar= 
sy region cpdnUnderline start='\(\\\)\@<!_' end='_' skip='\\_' keepend
      \ contains=@cpdnFormatters,cpdnUnderlineDelimiter

sy match cpdnCodeDelimiter '\(\\\)\@<!`' contained conceal cchar= 
sy region cpdnCode start='\(\\\)\@<!`' end='`' skip='\\`' keepend
      \ contains=@cpdnFormatters,cpdnCodeDelimiter

sy match cpdnBullet '\(^\s*\)\@<=-\( \)\@=' conceal cchar=•
sy match cpdnTitle '^[A-Z][A-Z0-9_ :?!/]\+' nextgroup=cpdnSubtitle
sy match cpdnSubtitle '.\+$' contained
sy match cpdnSeparator '^\s\+\*\*\*'


hi clear Conceal
hi link cpdnItalicDelimiter cpdnConceal
hi link cpdnUnderlineDelimiter cpdnConceal
hi link cpdnBullet cpdnConceal
hi link cpdnConceal Special
hi link cpdnBackslash Special
hi link cpdnTitle Title
hi link cpdnSubtitle Comment
hi link cpdnSeparator Identifier

hi cpdnItalic gui=italic
hi cpdnUnderline gui=underline
hi cpdnCode guibg=#222222

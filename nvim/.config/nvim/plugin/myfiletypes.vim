"
"  myfiletypes.vim
"

au! BufRead,BufNewFile *.alasm set filetype=alasm
au! BufRead,BufNewFile */notes/*.txt,braindump.txt set filetype=cpdnotes
au! BufRead,BufNewFile *.log set filetype=log

set colorcolumn=100
set textwidth=99
lua <<EOF
vim.keymap.set({'n'}, 'go', require'jdtls'.organize_imports)
EOF

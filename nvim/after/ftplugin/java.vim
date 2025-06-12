set colorcolumn=100
lua <<EOF
vim.keymap.set({'n'}, 'go', require'jdtls'.organize_imports)
EOF

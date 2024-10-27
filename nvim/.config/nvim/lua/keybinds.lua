-- LSP
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
vim.keymap.set('n', 'gr', vim.lsp.buf.rename, {})
vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, {})
vim.keymap.set('n', 'gu', vim.lsp.buf.references, {})
vim.keymap.set('n', 'g<space>', vim.lsp.buf.hover, {})

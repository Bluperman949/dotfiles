-- LSP
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
vim.keymap.set('n', 'gr', vim.lsp.buf.rename, {})
vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, {})

-- Terminal
local ftruns = {
  python = 'python %'
}
vim.keymap.set('n', '<F5>', function ()
  local cmd = ftruns[vim.bo.filetype]
  vim.cmd('silent !kitty @launch --type=overlay --cwd=current')
  if (cmd) then
    vim.cmd('silent !kitty @send-text --match state:active '..cmd)
  end
end)

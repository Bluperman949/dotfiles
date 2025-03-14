---@type function
local map = vim.keymap.set

return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-web-devicons' },
    event = 'VeryLazy',
    config = function()
      local fzf = require'fzf-lua'
      fzf.setup{
        'default',
        winopts = {
          row = 1, col = 0,
          width = 1, height = 0.8,
          border   = {'╶', '─', '╴', ' ', '╴', '─', '╶', ' '},
          preview = {
            border = { '',  '',  '', ' ', '╴', '─', '╶', ' '},
          },
        },
        files    = { winopts = { preview = { vertical = 'down:20%' }}},
        oldfiles = { winopts = { preview = { vertical = 'down:20%' }}},
        blines   = { winopts = { preview = { vertical = 'down:80%' }}},
      }

      map({'n', 'v'}, '<C-f>', '<nop>')
      map({'n', 'v'}, '<C-f><C-f>', fzf.blines)
      map({'n', 'v'}, '<C-f><C-r>', fzf.buffers)
      map({'n', 'v'}, '<C-f><C-o>', fzf.oldfiles)
      map({'n', 'v'}, '<C-f><C-i>', fzf.files)
      map({'n', 'v'}, '<C-f><C-p>', fzf.lsp_document_symbols)
      map({'n', 'v'}, '<C-f><C-p>', fzf.lsp_document_symbols)
      map({'n', 'v'}, '<C-f><C-g>', fzf.builtin)

      map({'n', 'v'}, 'gu', fzf.lsp_references)
      map({'n', 'v'}, 'gd', fzf.lsp_definitions)
      map({'n', 'v'}, 'ga', fzf.lsp_code_actions)
    end,
  },
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
  }
}

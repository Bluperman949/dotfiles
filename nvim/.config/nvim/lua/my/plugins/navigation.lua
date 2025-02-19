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
        'fzf-native',
      }

      map({'n', 'v'}, '<C-f>', '<nop>')
      map({'n', 'v'}, '<C-f><C-f>', fzf.blines)
      map({'n', 'v'}, '<C-f><C-r>', fzf.buffers)
      map({'n', 'v'}, '<C-f><C-o>', fzf.oldfiles)
      map({'n', 'v'}, '<C-f><C-i>', fzf.files)
      map({'n', 'v'}, '<C-f><C-b>', fzf.builtin)

      map({'n', 'v'}, 'gu', fzf.lsp_references)
      map({'n', 'v'}, 'gd', fzf.lsp_definitions)
      map({'n', 'v'}, 'ga', fzf.lsp_code_actions)
    end,
  },
  {
    'ggandor/leap.nvim',
    event = 'VeryLazy',
    config = function()
      map('n', 'ff', '<Plug>(leap)')
    end,
  },
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
  }
}

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
        keymap = {
          ['<A-q>'] = 'hide',
        },
      }

      map({'n', 'v'}, '<C-f>', '<nop>')
      map({'n', 'v'}, '<C-f><C-f>', fzf.blines)
      map({'n', 'v'}, '<C-f><C-b>', fzf.buffers)
      map({'n', 'v'}, '<C-f><C-o>', fzf.oldfiles)
      map({'n', 'v'}, '<C-f><C-i>', fzf.files)
      map({'n', 'v'}, '<C-S-f>', fzf.builtin)

      map({'n', 'v'}, 'gu', fzf.lsp_references)
      map({'n', 'v'}, 'gd', fzf.lsp_definitions)
      map({'n', 'v'}, 'ga', fzf.lsp_code_actions)
    end,
  },
  {
    'ggandor/leap.nvim',
    event = 'VeryLazy',
    config = function()
      map({ 'n', 'x', 'o' }, 'ff', '<Plug>(leap)')
    end,
  },
}

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

      -- "searching" with `<C-f>`
      map({'n'}, '<C-f>', '<nop>')
      map({'n'}, '<C-f><C-f>', fzf.blines)
      map({'n'}, '<C-f><C-p>', fzf.lsp_document_symbols)
      map({'n'}, '<C-f><C-b>', fzf.builtin)

      -- navigation with 't'
      map({'n'}, 'to', fzf.oldfiles)
      map({'n'}, 'ti', fzf.files)
      map({'n'}, 'tt', fzf.buffers)
      map({'n'}, 'tp', fzf.diagnostics_document)

      -- lsp with 'g'
      map({'n', 'v'}, 'gu', fzf.lsp_references)
      map({'n', 'v'}, 'gd', fzf.lsp_definitions)
      map({'n', 'v'}, 'ga', fzf.lsp_code_actions)

      -- dap with 'b'
      map({'n'}, 'bf', fzf.dap_breakpoints)
    end,
  },
}

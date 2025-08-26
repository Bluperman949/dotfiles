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
      }

      -- "searching" with `<C-f>`
      map({'n'}, '<C-f>', '<nop>') -- stop <C-f><any> from timing out
      map({'n'}, '<C-f><C-f>', fzf.blines)
      map({'n'}, '<C-f><C-b>', fzf.builtin)

      -- navigation with 't'
      map({'n'}, 'to', fzf.oldfiles)
      map({'n'}, 'ti', fzf.files)
      map({'n'}, 'tt', fzf.buffers)

      -- holdover from `trouble.nvim`. "tp" for "Trouble Problems"
      map({'n'}, 'tp', fzf.diagnostics_document)
      map({'n'}, 'tP', fzf.diagnostics_workspace)
      map({'n'}, 'tq', fzf.quickfix)

      -- lsp with 'g'
      map({'n'}, 'gu', fzf.lsp_references)
      map({'n'}, 'gd', fzf.lsp_definitions)
      map({'n'}, 'ga', fzf.lsp_code_actions)
      map({'n'}, 'gf', fzf.lsp_document_symbols)

      -- dap with 'gb'
      map({'n'}, 'gbf', fzf.dap_breakpoints)

      -- shut up that one error
      fzf.register_ui_select()
    end,
  },
}

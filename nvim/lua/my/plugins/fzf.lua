local map = function (lhs, rhs) vim.keymap.set('n', lhs, rhs) end

return {
  {
    'ibhagwan/fzf-lua',
    dependencies = {
      'nvim-web-devicons'
    },
    event = 'VeryLazy',
    config = function ()
      local fzf = require'fzf-lua'
      fzf.setup{
        'default',
      }

      -- "searching" with `<C-f>`
      map('<C-f>', '<nop>') -- stop <C-f><any> from timing out
      map('<C-f><C-f>', fzf.blines)
      map('<C-f><C-b>', fzf.builtin)
      map('<C-f><C-i>', fzf.grep_project)
      map('<C-f><C-g>', fzf.git_status)

      -- navigation with 't'
      map('to', fzf.oldfiles)
      map('ti', fzf.files)
      map('tt', fzf.buffers)

      -- holdover from `trouble.nvim`. "tp" for "Trouble Problems"
      map('tp', fzf.diagnostics_document)
      map('tP', fzf.diagnostics_workspace)
      map('tq', fzf.quickfix)

      -- lsp with 'g'
      map('gu', fzf.lsp_references)
      map('gd', fzf.lsp_definitions)
      map('ga', fzf.lsp_code_actions)
      map('gf', fzf.lsp_document_symbols)
      map('gF', fzf.lsp_workspace_symbols)
    end,
  },
}

return {
  {
    'mfussenegger/nvim-dap',
    event = { 'VeryLazy' },
    dependencies = {
      'mason-nvim-dap.nvim',
      'nvim-dap-virtual-text',
    },
    config = function ()
      local dap = require'dap'
      local fzf = require'fzf-lua'

      vim.keymap.set({'n'}, '<C-b><C-n>', dap.continue)
      vim.keymap.set({'n'}, '<C-b><C-u>', dap.step_over)
      vim.keymap.set({'n'}, '<C-b><C-i>', dap.step_into)
      vim.keymap.set({'n'}, '<C-b><C-o>', dap.step_out)
      vim.keymap.set({'n'}, '<C-b><C-b>', dap.toggle_breakpoint)
      vim.keymap.set({'n'}, '<C-b><C-t>', dap.repl.toggle)
      vim.keymap.set({'n'}, '<C-b><C-q>', dap.repl.close)
      vim.keymap.set({'n'}, ',b', dap.run_last)
      vim.keymap.set({'n'}, '<C-b><C-f>', fzf.dap_breakpoints)

      dap.defaults.fallback.terminal_win_cmd = 'vertical new'
      dap.defaults.fallback.focus_terminal = true
    end
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    config = function ()
      require'mason-nvim-dap'.setup{
        handlers = {},
        automatic_installation = false,
        ensure_installed = {
          'java-debug',
        },
      }
    end
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    config = function ()
      require'nvim-dap-virtual-text'.setup{
        virt_text_pos = 'eol',
      }
    end
  },
}

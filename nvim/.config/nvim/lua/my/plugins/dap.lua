return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'mason-nvim-dap.nvim',
      'nvim-dap-virtual-text',
    },
    config = function ()
      local dap = require'dap'
      vim.keymap.set({'n'}, 'bb', dap.toggle_breakpoint)
      vim.keymap.set({'n'}, 'bn', dap.continue)
      vim.keymap.set({'n'}, 'bi', dap.step_into)
      vim.keymap.set({'n'}, 'bb', dap.set_breakpoint)
    end
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    config = function ()
      require'nvim-dap-virtual-text'.setup{
      }
    end
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    config = function ()
      require'mason-nvim-dap'.setup{
        ensure_installed = {
          'java-debug',
          'python',
        }
      }
    end
  },
}

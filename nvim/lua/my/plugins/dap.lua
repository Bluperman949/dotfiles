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

      vim.keymap.set({'n'}, 'bn', dap.continue)
      vim.keymap.set({'n'}, 'bu', dap.step_over)
      vim.keymap.set({'n'}, 'bi', dap.step_into)
      vim.keymap.set({'n'}, 'bo', dap.step_out)
      vim.keymap.set({'n'}, 'bb', dap.toggle_breakpoint)
      vim.keymap.set({'n'}, 'bt', dap.repl.toggle)
      vim.keymap.set({'n'}, 'bT', dap.repl.close)
      vim.keymap.set({'n'}, 'b,', dap.run_last)
      vim.keymap.set({'n'}, 'bf', fzf.dap_breakpoints)

      dap.defaults.fallback.terminal_win_cmd = 'vertical new'
      dap.defaults.fallback.focus_terminal = true
      dap.set_exception_breakpoints('default')

      dap.adapters.codelldb = {
        name = 'codelldb server',
        type = 'server',
        port = '${port}',
        executable = {
          command = 'codelldb',
          args = { '--port', '${port}' },
        },
      }

      dap.configurations.cpp = {
        {
          name = 'Debug C++',
          type = 'codelldb',
          request = 'launch',
          preLaunchTask = "Compile C++",
          postLaunchTask = "Clean C++",
          expressions = 'native',
          program = '${workspaceFolder}/build/${workspaceFolderBasename}',
        },
      }
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
          'codelldb',
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

return {
  {
    'stevearc/oil.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function ()
      local oil = require'oil'
      oil.setup{}
      vim.keymap.set({'n'}, '-', oil.open)
    end
  },
}

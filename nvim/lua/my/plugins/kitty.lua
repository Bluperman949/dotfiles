return {
  {
    'knubie/vim-kitty-navigator',
    enabled = function ()
      return vim.env.TERM:match('kitty')
    end,
    event = 'VeryLazy',
    config = function ()
      vim.keymap.set({'n'}, '<A-w>', '<cmd>KittyNavigateUp<cr>'   , { silent = true })
      vim.keymap.set({'n'}, '<A-a>', '<cmd>KittyNavigateLeft<cr>' , { silent = true })
      vim.keymap.set({'n'}, '<A-s>', '<cmd>KittyNavigateDown<cr>' , { silent = true })
      vim.keymap.set({'n'}, '<A-d>', '<cmd>KittyNavigateRight<cr>', { silent = true })
    end
  }
}

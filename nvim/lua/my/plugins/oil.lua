return {
  {
    'nvim-tree/nvim-web-devicons',
  },
  {
    'stevearc/oil.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require'oil'.setup{}
    end
  },
}

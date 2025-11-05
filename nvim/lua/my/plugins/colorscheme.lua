return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function ()
      vim.cmd[[colorscheme gruvbox]]
      vim.cmd[[hi link Delimiter GruvboxFg3]]
    end,
  },
  {
    'neanias/everforest-nvim',
    lazy = false,
    priority = 1000,
    config = function ()
      require'everforest'.setup{
        background = 'hard',
      }
    end,
  },
  {
    'Mofiqul/vscode.nvim',
    lazy = false,
    priority = 1000,
  },
}

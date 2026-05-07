return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    event = 'VeryLazy',
    config = function ()
      require'nvim-treesitter'.setup{
        highlight = {
          enable = true,
          disable = {'html', 'vim'}
        },
        indent = {
          enable = true,
          disable = { 'python' } -- let vim-python-pep8-indent handle it
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = 'vv',
            node_incremental = 'v',
            node_decremental = 'b',
          },
        }
      }
    end
  },
}

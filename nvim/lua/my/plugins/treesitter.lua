local TS_LANGS = {
  'vim', 'lua', 'python', 'html',
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    config = function ()
      require'nvim-treesitter.configs'.setup{
        ensure_installed = TS_LANGS,
        highlight = {
          enable = true,
          disable = {'html', 'vim'}
        },
        indent = { enable = false },
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

local TS_LANGS = {
  'vim', 'lua', 'python', 'html', 'c',
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    config = function ()
      require'nvim-treesitter.configs'.setup{
        -- shut up warnings, these are the defaults
        modules = {},
        ignore_install = {},
        sync_install = false,
        auto_install = true,
        -- actual config here
        ensure_installed = TS_LANGS,
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

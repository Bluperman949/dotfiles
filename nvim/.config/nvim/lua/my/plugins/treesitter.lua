local TS_LANGS = {
  'vim', 'lua', 'python', 'html',
}

return {
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter' },
    event = 'VeryLazy',
    build = ':TSUpdate',
    config = function ()
      require'nvim-treesitter.configs'.setup{
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymps = {
              ['ip'] = '@parameter.inner',
              ['ap'] = '@parameter.outer',
              ['in'] = '@number.inner',
              ['an'] = '@number.outer',
              ['if'] = '@function.inner',
              ['af'] = '@function.outer',
            },
          },
        },
      }
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    -- event = 'VeryLazy',
    config = function()
      require'nvim-treesitter.configs'.setup{
        ensure_installed = TS_LANGS,
        highlight = {
          enable = true,
        },
        indent = {
          enable = false,
        },
        incremental_selection = {

        }
      }
    end
  },
}

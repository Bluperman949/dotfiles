return {
  {
    'L3MON4D3/LuaSnip',
    build = 'make install_jsregexp',
    config = function ()
      require'luasnip.loaders.from_lua'.load{
        paths = { './lua/my/snippets' },
      }
    end
  },
  {
    'saadparwaiz1/cmp_luasnip',
    dependencies = { 'LuaSnip' },
  },

  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-path'     },
  { 'hrsh7th/cmp-buffer'   },
  { 'hrsh7th/cmp-cmdline'  },
  {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      'nvim-lspconfig',
      'cmp-nvim-lsp',
      'cmp-path',
      'cmp-cmdline',
      'cmp-buffer',
      'cmp_luasnip',
      'nvim-autopairs',
    },
    config = require'my.cmp'.config,
  },
}

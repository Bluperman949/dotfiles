-- TODO: modularize

local dataPath = vim.fn.stdpath('data')..'/lazy/'

local plugins = {
  'ellisonleao/gruvbox.nvim',
  'nvim-treesitter/nvim-treesitter',
  'junegunn/fzf',
  'junegunn/fzf.vim',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'windwp/nvim-autopairs',
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.3.0',
    build = 'make install_jsregexp',
    dependencies = {
      'Wscats/html-snippets',
      'sidthesloth92/vsc_svg_snippets'
    },
  },
  'saadparwaiz1/cmp_luasnip',
  'Vimjas/vim-python-pep8-indent',
  'alvan/vim-closetag',
  'tpope/vim-surround',
  'folke/trouble.nvim',
  'tpope/vim-commentary',
  'nvim-java/nvim-java',
  'jalvesaq/nvim-r',
  {
    'MunsMan/kitty-navigator.nvim',
    build = {
      'cp '..dataPath..'kitty-navigator.nvim/*.py ~/.config/kitty/'
    },
    opts = {
      keybindings = {
        left = '<A-a>', down  = '<A-s>',
        up   = '<A-w>', right = '<A-d>'
      }
    }
  }
}

return plugins

local TS_LANGS = {
  'vim', 'lua', 'python', 'bash', 'java', 'groovy', 'zig',
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter-textobjects' },
    event = 'VeryLazy',
    config = function()
      require'nvim-treesitter.configs'.setup{
        ensure_installed = TS_LANGS,
        highlight = {
          enable = true,
        },
      }
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
}

local TS_LANGS = {
  'vim', 'lua', 'python', 'bash', 'java', 'zig'
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    config = function()
      require'nvim-treesitter.configs'.setup{ ensure_installed = TS_LANGS }
    end
  },
}

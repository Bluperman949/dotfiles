return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    -- also loaded as dependency by nvim-cmp
    config = true,
  },
  {
    'tpope/vim-surround',
    event = 'VeryLazy',
    enabled = function() return not vim.bo.readonly end,
  },
  {
    'Vimjas/vim-python-pep8-indent',
    ft = { 'python' },
  },
}

local function not_readonly() return not vim.bo.readonly end

return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter', -- also loaded as dependency by nvim-cmp
    config = true,
  },
  {
    'tpope/vim-surround',
    event = 'VeryLazy',
    enabled = not_readonly,
  },
  {
    'Vimjas/vim-python-pep8-indent',
    ft = { 'python' },
  },
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    config = true,
  },
}

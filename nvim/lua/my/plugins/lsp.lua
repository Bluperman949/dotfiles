local function jdt_start_or_attach()
  require'jdtls'.start_or_attach(require'my.jdtls-config')
end

return {
  {
    'williamboman/mason.nvim',
    -- loaded as dependency
    opts = {},
  },
  {
    'williamboman/mason-lspconfig.nvim',
    -- loaded as dependency
    opts = {
      -- auto-start LSPs with default settings
      automatic_enable = true,
    },
  },
  {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    dependencies = {
      'mason.nvim',
      'mason-lspconfig.nvim',
      'cmp-nvim-lsp',
      'tiny-inline-diagnostic.nvim',
    },
    keys = {
      { 'gr', vim.lsp.buf.rename },
      { 'g<space>', vim.lsp.buf.hover },
    },
    config = function ()
    end
  },
  {
    'mfussenegger/nvim-jdtls',
    ft = { 'java', 'kotlin', 'gradle' },
    dependencies = { 'nvim-dap' },
    config = function ()
      vim.api.nvim_create_autocmd({'BufRead'}, {
        pattern = { '*.java' },
        callback = jdt_start_or_attach,
      })
      jdt_start_or_attach()
    end,
  },
}

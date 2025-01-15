local LSPS = {
  'lua_ls', 'vimls', 'bashls', 'basedpyright', 'html', 'cssls', 'zls',
}
local LSP_CONFIGS = {
  zls = { filetypes = {'zig', 'zon', 'zir'} },
  bashls = { filetypes = {'sh', 'zsh'} },
}

return {
  {
    'williamboman/mason.nvim',
    -- loaded as dependency
    config = function()
      require'mason'.setup{}
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    -- loaded as dependency
    config = function()
      require'mason-lspconfig'.setup{ ensure_installed = LSPS }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    dependencies = {
      'mason.nvim',
      'mason-lspconfig.nvim',
      'cmp-nvim-lsp'
    },
    keys = {
      { 'gd', vim.lsp.buf.definition  },
      { 'gr', vim.lsp.buf.rename      },
      { 'ga', vim.lsp.buf.code_action },
      { 'gu', vim.lsp.buf.references  },
      { 'g<space>', vim.lsp.buf.hover },
    },
    config = function()
      local lspconfig = require'lspconfig'
      local capabilities = require'cmp_nvim_lsp'.default_capabilities()
      for _,i in pairs(LSPS) do
        local cfg = LSP_CONFIGS[i] or {}
        cfg.capabilities = capabilities
        lspconfig[i].setup(cfg)
      end
      -- re-do FileType to auto-start any LSs
      vim.api.nvim_exec_autocmds('FileType', {})

    end
  },
  {
    'mfussenegger/nvim-jdtls',
    config = function()
      require'jdtls'.start_or_attach(require'my.jdtls-config')
    end,
  },
}

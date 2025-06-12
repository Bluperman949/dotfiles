local LSPS = {
  'lua_ls', 'vimls', 'bashls', 'basedpyright',
  'html', 'cssls', 'emmet_ls', 'tinymist',
  'zls',
}
local LSP_CONFIGS = {
  zls = { filetypes = {'zig', 'zon'} },
  bashls = { filetypes = {'sh', 'zsh'} },
  emmet_ls = { filetypes = {'html'} },
}

local function jdt_start_or_attach()
  require'jdtls'.start_or_attach(require'my.jdtls-config')
end

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
      'cmp-nvim-lsp',
      'tiny-inline-diagnostic.nvim',
    },
    keys = {
      { 'gr', vim.lsp.buf.rename },
      { 'g<space>', vim.lsp.buf.hover },
    },
    config = function()
      local lspconfig = require'lspconfig'
      local default_caps = require'cmp_nvim_lsp'.default_capabilities()
      for _,ls in pairs(LSPS) do
        local cfg = LSP_CONFIGS[ls] or {}
        cfg.capabilities = default_caps
        lspconfig[ls].setup(cfg)
      end
      vim.lsp.start_client()
    end
  },
  {
    'mfussenegger/nvim-jdtls',
    ft = { 'java' },
    dependencies = { 'nvim-dap' },
    config = function ()
      vim.api.nvim_create_autocmd({'BufRead'}, {
        pattern = { '*.java' },
        callback = jdt_start_or_attach,
      })
      jdt_start_or_attach()
    end,
    build = function ()
    end,
  },
}

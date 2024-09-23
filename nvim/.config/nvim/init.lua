-- consts
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
LSPS = {
    'lua_ls', 'clangd', 'vimls', 'basedpyright'
}

-- vim opts
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard = 'unnamed'

-- setup Lazy if nonexistent
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git','clone','--filter=blob:none','https://github.com/folke/lazy.nvim.git',
    lazypath
  })
end

-- make nvim load Lazy
vim.opt.rtp:prepend(lazypath)

-- load plugins and do basic init/config
require('lazy').setup('plugins')
vim.cmd 'colorscheme gruvbox'
require('nvim-tree').setup {}
require('nvim-autopairs').setup {
  event = 'InsertEnter',
  config = true
}

-- LSP and autocomplete setup
local lspconfig = require('lspconfig')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local luasnip = require('luasnip')

luasnip.setup {
  version = 'v2.3.0',
  build = 'make install_jsregexp'
}
require("luasnip.loaders.from_vscode").lazy_load({ paths = "./snippets" })

mason.setup {}
mason_lspconfig.setup {
  ensure_installed = LSPS
}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Esc>'] = cmp.mapping (

    ),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.confirm({select = true})
      elseif luasnip.expandable() then luasnip.expand()
      elseif luasnip.locally_jumpable(1) then luasnip.jump(1)
      else fallback() end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.locally_jumpable(-1) then luasnip.jump(-1)
      else fallback() end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources(
    {{ name = 'nvim_lsp' }, { name = 'luasnip' }},
    {{ name = 'buffer' }}
  ),
  experimental = {
      ghost_text = true
  }
}

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {{ name = 'buffer' }}
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
    {{ name = 'path' }},
    {{ name = 'cmdline' }}
  ),
  matching = { disallow_symbol_nonprefix_matching = false }
})

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

local capabilities = require('cmp_nvim_lsp').default_capabilities()
for _,i in pairs(LSPS) do
  lspconfig[i].setup {
    capabilities = capabilities
  }
end

-- keybinds
require('keybinds')

local M = {}

M.config = function()
  local cmp = require'cmp'
  local luasnip = require'luasnip'
  local SELECT_BEHAVIOR = { behavior = cmp.SelectBehavior.Select }

  cmp.setup{
    window = {},
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    sources = cmp.config.sources{
      { name = 'nvim_lsp' },
      { name = 'path'     },
      { name = 'buffer'   },
      { name = 'luasnip'  },
    },
    experimental = { ghost_text = true, },
    completion = { completeopt = 'noinsert', },

    mapping = cmp.mapping.preset.insert{
      ['<C-space>'] = cmp.mapping.complete(),
      ['<C-k>'] = cmp.mapping.select_prev_item(SELECT_BEHAVIOR),
      ['<C-j>'] = cmp.mapping.select_next_item(SELECT_BEHAVIOR),
      -- cancel completion with ctrl+l (moving onwards ->)
      ['<C-l>'] = cmp.mapping(function(fallback)
        if cmp.visible() then cmp.abort()
        else fallback() end
      end, { 'i', 'c' }),
      -- confirm completion from luasnip/cmp with Tab
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then cmp.confirm()
        elseif luasnip.expandable() then luasnip.expand()
        else fallback() end
      end, { 'i', 's', 'c' }),
      -- jump between snippet fields with ctrl+n/p
      ['<C-n>'] = cmp.mapping(function(fallback)
        if luasnip.locally_jumpable(1) then luasnip.jump(1)
        else fallback() end
      end, { 'i', 's' }),
      ['<C-p>'] = cmp.mapping(function(fallback)
        if luasnip.locally_jumpable(-1) then luasnip.jump(-1)
        else fallback() end
      end, { 'i', 's' }),
    }, --/cmp.setup.mapping
  } -- /cmp.setup

  MAPPINGS_CMDLINE = cmp.mapping.preset.cmdline{
    ['<C-k>'] = cmp.mapping(function()
      cmp.select_prev_item()
    end, {'c'}),
    ['<C-j>'] = cmp.mapping(function()
      cmp.select_next_item()
    end, {'c'}),
    ['<C-l>'] = cmp.mapping(function()
      cmp.close()
    end, {'c'}),
    ['<Tab>'] = cmp.mapping(function()
      cmp.confirm({select = true})
    end, {'c'}),
    ['<C-p>'] = cmp.mapping(function()
    end, {'c'}),
    ['<C-n>'] = cmp.mapping(function()
    end, {'c'}),
  }

  cmp.setup.cmdline({ '/', '?' }, {
    sources = {
      { name = 'buffer' },
    },
    mapping = MAPPINGS_CMDLINE,
  })
  cmp.setup.cmdline({ ':' }, {
    sources = {
      { name = 'path'    },
      { name = 'cmdline' },
      { name = 'buffer'  },
    },
    mapping = MAPPINGS_CMDLINE,
  })
end

return M

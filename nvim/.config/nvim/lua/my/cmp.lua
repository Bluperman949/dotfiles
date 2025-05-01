local M = {}

M.config = function()
  local cmp = require'cmp'
  local ls = require'luasnip'

  local SELECT_BEHAVIOR = { behavior = cmp.SelectBehavior.Select }

  -- close cmp
  local mapping_abort = cmp.mapping(function(fallback)
    if cmp.visible() then cmp.abort()
    else fallback() end
  end, { 'i', 'c' })
  -- jump back in snippet
  local mapping_prev = cmp.mapping(function(fallback)
    if ls.locally_jumpable(-1) then ls.jump(-1)
    else fallback() end
  end, { 'i', 's' })
  -- expand completion or jump forward
  local mapping_complete_or_next = cmp.mapping(function(fallback)
    if cmp.visible() then cmp.confirm()
    elseif ls.expandable() then ls.expand()
    elseif ls.locally_jumpable() then ls.jump(1)
    else fallback() end
  end, { 'i', 's', 'c' })
  -- just jump forward
  local mapping_next = cmp.mapping(function(fallback)
    if ls.locally_jumpable(1) then ls.jump(1)
    else fallback() end
  end, { 'i', 's' })

  cmp.setup{
    window = {
      -- completion = {
      --   border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
      --   winhighlight = 'Normal:CmpPmenu,FloatBorder:Comment',
      -- },
      -- documentation = {
      --   border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
      --   winhighlight = 'Normal:Normal,FloatBorder:Comment',
      -- },
    },
    formatting = {
      format = function(_, item)
        if item.menu and #item.menu > 40 then
          item.menu = string.sub(item.menu, 1, 39)..'…'
        end
        if #item.abbr > 40 then
          item.abbr = string.sub(item.abbr, 1, 39)..'…'
        end
        return item
      end
    },
    snippet = {
      expand = function(args)
        ls.lsp_expand(args.body)
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
      ['<C-k>']     = cmp.mapping.select_prev_item(SELECT_BEHAVIOR),
      ['<C-j>']     = cmp.mapping.select_next_item(SELECT_BEHAVIOR),
      ['<C-l>']     = mapping_abort,
      ['<tab>']     = mapping_complete_or_next,
      ['<C-n>']     = mapping_next,
      ['<S-tab>']   = mapping_prev,
      ['<C-p>']     = mapping_prev,
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
      -- TODO: prev item in history
    end, {'c'}),
    ['<C-n>'] = cmp.mapping(function()
      -- TODO: next item in history
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

  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

return M

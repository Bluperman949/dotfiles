local M = {}

M.config = function ()
  local cmp = require'cmp'
  local ls = require'luasnip'

  -- open/close cmp
  local mapping_toggle = cmp.mapping(function ()
    if cmp.visible() then cmp.abort()
    else cmp.complete() end
  end, { 'i', 'c' })

  -- select previous completion
  local mapping_select_prev = cmp.mapping(function (fallback)
    if cmp.visible() then cmp.select_prev_item()
    else fallback() end
  end, { 'i', 'c' })
  -- select next completion
  local mapping_select_next = cmp.mapping(function (fallback)
    if cmp.visible() then cmp.select_next_item()
    else fallback() end
  end, { 'i', 'c' })
  -- confirm selection
  local mapping_confirm = cmp.mapping(function (fallback)
    if cmp.visible() then cmp.confirm()
    else fallback() end
  end, { 'i', 'c' })

  -- jump backwards in snippet
  local mapping_jump_backwards = cmp.mapping(function ()
    if ls.locally_jumpable(-1) then ls.jump(-1) end
  end, { 'i', 's' })
  -- jump forwards in snippet
  local mapping_jump_forwards = cmp.mapping(function ()
    if ls.locally_jumpable(1) then ls.jump(1) end
  end, { 'i', 's' })

  local MAPPINGS_INSERT = {
    -- open completion or abort completion with Ctrl+Space
    ['<C-space>'] = mapping_toggle,
    -- select previous and next completion with Ctrl+K and Ctrl+J
    ['<C-k>'] = mapping_select_prev,
    ['<C-j>'] = mapping_select_next,
    -- confirm selection with Tab/Ctrl+I
    ['<tab>'] = mapping_confirm,
    -- jump forwards and backwards in snippet with Ctrl+N and Ctrl+P
    ['<C-n>'] = mapping_jump_forwards,
    ['<C-p>'] = mapping_jump_backwards,
  }

  local MAPPINGS_CMDLINE = {
    -- same as insert mode, but no snippets
    ['<C-space>'] = mapping_toggle,
    ['<C-k>'] = mapping_select_prev,
    ['<C-j>'] = mapping_select_next,
    ['<tab>'] = mapping_confirm,
  }

  cmp.setup{
    window = {
      completion = {
        border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
        winhighlight = 'Normal:CmpPmenu,FloatBorder:Comment',
      },
      documentation = {
        border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
        winhighlight = 'Normal:Normal,FloatBorder:Comment',
      },
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
      { name = 'luasnip'  },
      { name = 'path'     },
      { name = 'buffer'   },
    },
    experimental = { ghost_text = true, },
    completion = { completeopt = 'noinsert', },

    mapping = MAPPINGS_INSERT,
  } -- /cmp.setup

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

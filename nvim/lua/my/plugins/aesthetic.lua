
return {
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    -- loaded as dependency by nvim-lspconfig
    config = function()
      require'tiny-inline-diagnostic'.setup{
        preset = "powerline",
      }
      vim.diagnostic.config({ virtual_text = false })
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-web-devicons' },
    config = function ()
      local luasnip_status = function ()
        local cur = require'luasnip'.get_active_snip()
        if cur == nil then return '' end
        return 'snip('..cur.current_insert..'/'..#cur.insert_nodes..')'
      end

      require'lualine'.setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = '',
          section_separators = { left = '', right = '' },
          disabled_filetypes = { statusline = {}, winbar = {}, },
          ignore_focus = {},
          always_divide_middle = false,
          always_show_tabline = false,
          globalstatus = false,
          refresh = {
            statusline = 100,
            tabline = 200,
            winbar = 200,
          }
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'filename'},
          lualine_c = {'branch', 'diff', luasnip_status},
          lualine_x = {'diagnostics', 'lsp_status'},
          lualine_y = {'location', 'progress'},
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {'filename'},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {'location', 'progress'},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
      vim.cmd[[set noshowmode]]
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'VeryLazy',
    config = function ()
      require'ibl'.setup()
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function ()
      vim.cmd[[colorscheme gruvbox]]
    end,
  }
}

local colors = {
  bg0     = '282828',
  bg1     = '3c3836',
  bg2     = '504945',
  bg3     = '665c54',
  bg4     = '7c6f64',
  gray    = '928374',
  fg4     = 'a89984',
  fg3     = 'bdae93',
  fg2     = 'd5c4a1',
  fg1     = 'ebdbb2',
  fg0     = 'fbf1c7',
  red     = 'fb4934',
  green   = 'b8bb26',
  yellow  = 'fabd2f',
  blue    = '83a598',
  purple  = 'd3869b',
  aqua    = '8ec07c',
  orange  = 'fe8019',
}

local lualine_theme = {
  normal = {
    a = { fg = colors.bg0, bg = colors.fg4   , gui = 'bold' },
    b = { fg = colors.fg0, bg = colors.bg3   ,              },
    c = { fg = colors.fg2, bg = colors.bg2   ,              }
  },
  inactive = {
    a = { fg = colors.bg0, bg = colors.bg4   ,              },
    b = { fg = colors.fg2, bg = colors.bg1   ,              },
    c = { fg = colors.fg2, bg = colors.bg1   ,              }
  },
  insert = {
    a = { fg = colors.bg0, bg = colors.yellow, gui = 'bold' },
    b = { fg = colors.fg0, bg = colors.bg4   ,              },
    c = { fg = colors.fg1, bg = colors.bg3   ,              }
  },
  replace = {
    a = { fg = colors.bg0, bg = colors.red   , gui = 'bold' },
    b = { fg = colors.fg0, bg = colors.bg4   ,              },
    c = { fg = colors.fg1, bg = colors.bg3   ,              }
  },
  command = {
    a = { fg = colors.bg0, bg = colors.orange, gui = 'bold' }
  },
  visual = {
    a = { fg = colors.bg0, bg = colors.blue  , gui = 'bold' },
  },
  terminal = {
    a = { fg = colors.bg0, bg = colors.green , gui = 'bold' }
  },
}

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

      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = lualine_theme,
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

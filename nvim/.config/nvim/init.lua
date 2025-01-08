DATAPATH = vim.fn.stdpath'data'..'/lazy/'

require'my.lazy' -- provides `lazy` module

require'lazy'.setup{ -- `require'plugin'.setup{}` called on all nonlazy plugins
  change_detection = { enabled = false }, -- don't freeze when I make edits
  defaults = { lazy = true }, -- lazy-load plugins by default
  spec = { import = 'my.plugins' }, -- plugin specs in ./lua/plugins/
}

-- require'my.debug'

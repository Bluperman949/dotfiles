local map = function (lhs, rhs) vim.keymap.set('n', lhs, rhs) end

return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    config = function ()
      local gs = require'gitsigns'
      gs.setup{
        signs = {
          add          = { text = '│' },
          change       = { text = '┆' },
          changedelete = { text = '┆' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
        },
        signs_staged_enable = false,
        current_line_blame = false,
      }

      map('[g', function () gs.nav_hunk('prev') end)
      map(']g', function () gs.nav_hunk('next') end)
      map('ghh', gs.preview_hunk_inline)
      map('ghr', gs.reset_hunk)
      map('gha', gs.stage_hunk)
      map('ghA', gs.stage_buffer)
    end,
  },
}

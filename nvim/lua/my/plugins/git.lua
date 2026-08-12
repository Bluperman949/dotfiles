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
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
        },
        signs_staged_enable = false,
        current_line_blame = false,
      }
      vim.keymap.set({'n'}, '<C-g><C-h>', gs.blame_line)
      vim.keymap.set({'n'}, '<C-g><C-b>', gs.blame)
    end
  },
}

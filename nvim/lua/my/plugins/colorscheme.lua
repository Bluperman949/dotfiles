return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function ()
      vim.api.nvim_create_autocmd('ColorScheme', {
        command = [[
        hi link Delimiter GruvboxFg3 |
        hi Folded gui=italic cterm=italic guibg=#282828 |
        hi GruvboxYellowItalic gui=italic cterm=italic guifg=#fabd2f |
        hi link @interface GruvboxYellowItalic |
        hi clear SignColumn
        ]],
        pattern = 'gruvbox',
      })
      vim.cmd[[colorscheme gruvbox]]
    end,
  },
  {
    'neanias/everforest-nvim',
    config = function ()
      require'everforest'.setup{
        background = 'hard',
      }
    end,
  },
  {
    'Mofiqul/vscode.nvim',
  },
  {
    'nordtheme/vim',
  },
}

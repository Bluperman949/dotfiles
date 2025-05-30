return {
  {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    config = function ()
      require'typst-preview'.setup{}
    end
  },
}

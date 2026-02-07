return {
  {
    'Bluperman949/maker.nvim',
    event = 'VeryLazy',
    config = function ()
      require'maker'.setup{
        window_command = 'tabnew | term',
      }
    end
  }
}

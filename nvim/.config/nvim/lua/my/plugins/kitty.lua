return {
  {
    'MunsMan/kitty-navigator.nvim',
    event = 'VeryLazy',
    build = {
      'cp '..DATAPATH..'kitty-navigator.nvim/*.py ~/.config/kitty/'
    },
    opts = {
      keybindings = {
        left  = '<A-a>',
        down  = '<A-s>',
        up    = '<A-w>',
        right = '<A-d>',
      }
    },
  }
}

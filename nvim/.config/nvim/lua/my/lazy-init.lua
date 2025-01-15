local lazypath = DATAPATH..'lazy.nvim'

-- setup Lazy if nonexistent
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git', lazypath,
  })
end

-- make Lazy available to nvim
vim.opt.rtp:prepend(lazypath)

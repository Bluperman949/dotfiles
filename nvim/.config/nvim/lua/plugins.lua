local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git","clone","--filter=blob:none","https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
    "ellisonleao/gruvbox.nvim",
    "junegunn/fzf",
    "junegunn/fzf.vim",
    {
      "nvim-tree/nvim-tree.lua",
      opts = {
          on_attach = my_on_attach,
      },
    },
    "nvim-telescope/telescope.nvim",
}

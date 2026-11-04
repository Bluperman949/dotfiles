local EXCLUDED_LANGS = {
  'make',
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufReadPost',
    config = function ()
      vim.api.nvim_create_autocmd('FileType', {
        callback = function (_)
          local parser = vim.treesitter.get_parser()
          -- vim.print(parser)
          if parser and not vim.tbl_contains(EXCLUDED_LANGS, parser:lang()) then
            vim.treesitter.start()
          end
        end
      })
    end
  },
}

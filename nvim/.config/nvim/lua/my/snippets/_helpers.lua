local M = {}

function M.srcname(argnode, parent)
  return vim.fn.fnamemodify(parent.env.TM_FILENAME, ':r')
end

return M

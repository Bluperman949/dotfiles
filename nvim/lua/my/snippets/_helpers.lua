local M = {}

M.srcname = function (argnode, parent)
  return vim.fn.fnamemodify(parent.env.TM_FILENAME, ':r')
end

M.copy = function (args, parent, uargs)
  return args[1];
end

return M

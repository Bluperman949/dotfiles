function ptk(t)
  vim.cmd('tabnew')
  keys = {}
  for k,_ in pairs(t) do
    keys[#keys+1] = k
  end
  vim.api.nvim_put(keys,'l',false,false)
end



" inspect ASCII (default conflicts with LSP binds)
nno <C-h><C-a> ga

" inspect highlight/syntax
nno <C-h><C-h> <cmd>call GetSyntax()<cr>
function GetSyntax()
  let l:groups=map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
  :Inspect
  if empty(l:groups) | return | end
  exec 'syn list ' . join(l:groups, ' ')
endfunction

" inspect treesitter
nno <C-h><C-s> <cmd>lua vim.print(vim.treesitter.get_captures_at_cursor())<cr>

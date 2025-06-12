function printt(t)
  if type(t) == 'table' then
    print'{'
    for k,v in pairs(t) do print('  ', k, '->', v) end
    print'}'
  else
    print(t)
  end
end



local _ENV = require'my.snippets._defs'

local function copy(args, parent, uargs)
  return args[1];
end

return {
  s('whii', {
    t'while (',
      i(1, 'i'), t' < ', i(2, 'len'),
    t') : (',
      f(copy, {1}),
    t' += 1) {', t'}'
  }),
}

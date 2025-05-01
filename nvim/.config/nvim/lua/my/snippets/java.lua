local _ENV = setmetatable({}, { __index = require'my.snippets._defs' })
local h = require'my.snippets._helpers'

local function copy(args, parent, uargs)
  return args[1];
end

return {
  -- pure text shortcuts
  s('ps', { t'public static ' }),
  s('doc', {
    t{'/**',
      ' * '}, i(1), t{'',
    '**/'}
  }),

  -- common statements
  s('print', {
    t'System.out.print', i(1), t'(', i(2), t');',
  }),
  s('pf', {
    t'System.out.printf("', i(1), t'", ', i(2), t');',
  }),
  s('p', {
    t'System.out.println(', i(1), t');',
  }),
  s('fori', {
    t'for (int i = 0; i < ', i(1), t'; i++) '
  }),
  s('for', {
    t'for (int ', i(1, 'i'),    t' = ', i(2, '0'), t'; ',
                  f(copy, {1}), t' < ', i(3),      t'; ',
                  f(copy, {1}), i(4, '++'), t') '
  }),

  -- boilerplate
  s('class', {
    t'public class ', f(h.srcname, {1}), i(1), t{' {',
      '\t'}, i(2), t{'',
    '}'},
  }),
}

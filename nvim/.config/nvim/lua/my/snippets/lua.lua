local _ENV = require'my.snippets._defs'

return {
  s('lsnip', {
    t"s('", i(1), t{"', {",
      '\t'}, i(2), t{'',
    '}),'}
  }),
  s('rq', {
    t"require'", i(1), t"'"
  }),
  s('local', {
    t'local ', i(1), t' = '
  }),
  s('M', {
    t{'local M = {}',
    '',
    ''}, i(1), t{'',
    '',
    'return M'}
  }),
}

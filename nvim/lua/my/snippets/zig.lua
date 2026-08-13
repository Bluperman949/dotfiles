local ls = require'my.snippets._defs'
local h = require'my.snippets._helpers'
local s, i, t, f = ls.s, ls.i, ls.t, ls.f

return {
  s('whii', {
    t('while ('),
    i(1, 'i'),
    t(' < '),
    i(2, 'len'),
    t(') : ('),
    f(h.copy, {1}),
    t(' += 1) {'),
    i(0),
    t('}')
  }),
}

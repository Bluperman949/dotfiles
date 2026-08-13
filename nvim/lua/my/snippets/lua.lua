local ls = require'my.snippets._defs'
local s, i, t = ls.s, ls.i, ls.t

return {
  s('rq', { t('require\''), i(0), t('\'') }),
  s('lc', { t('local '), i(1), t(' = '), i(0) }),
  s('M', {
    t({ 'local M = {}', '', '' }),
    i(0),
    t({ '', '', 'return M' })
  }),
}

local ls = require'my.snippets._defs'
local h = require'my.snippets._helpers'
local s, i, t, f = ls.s, ls.i, ls.t, ls.f

return {
  -- pure text shortcuts
  s('ps', { t('public static '), i(0), }),
  s('doc', { t({ '/**', ' * ' }), i(0), t({ '', '**/' }) }),

  -- common statements
  s('print', { t('System.out.print'), i(1), t('('), i(0), t(');'), }),
  s('pf', { t('System.out.printf("'), i(1), t('", '), i(0), t(');'), }),
  s('p', { t('System.out.println('), i(0), t(');'), }),

  -- loops
  s('fori', {
    t('for (int i = 0; i < '), i(1), t('; i++) '), i(0)
  }),
  s('for', {
    t('for (int '), i(1, 'i'), t(' = '), i(2, '0'), t('; '),
    f(h.copy, {1}), t(' < '), i(3, 'arr.length'), t('; '),
    f(h.copy, {1}), i(4, '++'), t(') '), i(0)
  }),

  -- boilerplate
  s('class', {
    t('public class '),
    f(h.srcname, {1}),
    i(1),
    t({ ' {', '\t' }),
    i(2),
    t({ '', '}' }),
  }),
}

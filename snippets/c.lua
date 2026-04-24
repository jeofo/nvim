local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("setb", {
    i(1, "REGISTER"),
    t(" |= (1 << "),
    i(2, "n"),
    t(");"),
  }),
  s("clrb", {
    i(1, "REGISTER"),
    t(" &= ~(1 << "),
    i(2, "n"),
    t(");"),
  }),
  s("rdb", {
    i(1, "REGISTER"),
    t(" & (1 << "),
    i(2, "n"),
    t(")"),
  }),
}

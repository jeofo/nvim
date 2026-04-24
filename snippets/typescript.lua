local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("fetchj", {
        t("const "),
        i(1, "data"),
        t(" = await (await fetch(`"),
        i(2, "url"),
        t("`)).json();"),
    }),

    s("csl", {
        t("console.log("),
        i(1, "object"),
        t(");"),
    }),

    s("fn", {
        t("const "),
        i(1, "functionName"),
        t(" = ("),
        i(2, "params"),
        t({ ") => {", "\t" }),
        i(3, "// body"),
        t({ "", "};" }),
    }),

    s("imp", {
        t("import "),
        i(1, "{ something }"),
        t(" from '"),
        i(2, "module"),
        t("';"),
    }),
}

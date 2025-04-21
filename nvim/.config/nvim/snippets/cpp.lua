local ls = require("luasnip")
local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local i = ls.insert_node
local f = ls.function_node
local t = ls.text_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmta = require("luasnip.extras.fmt").fmta
local fmt = require("luasnip.extras.fmt").fmt
local utils = require("plxg.snippets")
local is_math = utils.in_latex_math
local no_backslash = utils.no_backslash
local pipe = utils.pipe

return {
    s({trig="struct", name='C++ Struct'},
        fmta("struct <> {\n\t<>\n};<>",
            {   i(1, "name"),
                i(2, "members"),
                i(0),
            }
        )
    ),
    s({trig="fn", name='C++ Function'},
        fmta("<> <>(<>){\n\t<>\n}<>",
            {   i(1, "ret"),
                i(2, "fn"),
                i(3, "args"),
                i(4, "body"),
                i(0),
            }
        )
    ),
    as({trig="ret "}, {t"return ", i(0)}
    ),
}

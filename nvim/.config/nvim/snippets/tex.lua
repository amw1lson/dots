local ls = require("luasnip")
local as = ls.extend_decorator.apply(ls.s, { snippetType = "autosnippet" })

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local i = ls.insert_node
local f = ls.function_node
local t = ls.text_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmta = require("luasnip.extras.fmt").fmta
local utils = require("plxg.snippets")

local is_math = utils.in_latex_math
local no_backslash = utils.no_backslash
local pipe = utils.pipe

local mySnips = {
    as({trig=';beg'}, fmta("\\begin{<>} \n<>\n\\end{<>}<>",
    {   i(1, "env"),
        i(2, ""),
        rep(1),
        i(0),
    })),

    as({trig='langle'}, fmta([[\langle <> \rangle <>]],
    {   i(1, "ordered pair"),
        i(0),
    })),

    as({trig=';it'}, fmta([[\item <>]],
    { i(0), })),

    as({trig=';pf'}, fmta([[\begin{tcolorbox}[colframe=blue]
    \color{blue}
    <>
\end{tcolorbox}<>]],
    {   i(1, "env"),
        i(0)
    })),

    as({trig='$'}, fmta([[$<>$<>]],
    {   i(1, "math"),
        i(0)
    })),

    as({trig='_',wordTrig = false, condition = is_math}, fmta([[_{<>}<>]],
    {   i(1, "math"),
        i(0)
    })),

    as({trig='^', wordTrig = false, condition = is_math},
        fmta([[^{<>}<>]],
        {   i(1, "math"),
            i(0)}
        )
    ),

    as({trig='set', condition = is_math, wordTrig = false},
        fmta([[\{<>\}<>]],
        {   i(1, "contents"),
            i(0)}
        )
    ),

    as({trig = '([%a%)%]%}])([%d])', regTrig = true, wordTrig = false, condition = is_math},
      fmta(
        "<>_{<><>}<>",
        {
          f( function(_, snip) return snip.captures[1] end ),
          f( function(_, snip) return snip.captures[2] end ),
          i(1),
          i(0),
        }
      )
    ),
}

local gen_automath = function(trig, text) 
    return as(
        {trig=trig, snippetType="autosnippet", condition=is_math}, 
        {
            t(text),
        }
    )
end
    
local automath_snips =
{
    ['>a'] = '\\alpha',
    ['>A'] = '\\Alpha',
    ['>b'] = '\\beta',
    ['>B'] = '\\Beta',
    ['>g'] = '\\gamma',
    ['>G'] = '\\Gamma',
    ['>d'] = '\\delta',
    ['>D'] = '\\Delta',
    ['>e'] = '\\epsilon',
    ['>E'] = '\\Epsilon',
    ['>ve'] = '\\varepsilon',
    ['>z'] = '\\zeta',
    ['>Z'] = '\\Zeta',
    ['>h'] = '\\eta',
    ['>H'] = '\\Eta',
    ['>th'] = '\\theta',
    ['>Th'] = '\\Theta',
    ['>i'] = '\\iota',
    ['>I'] = '\\Iota',
    ['>k'] = '\\kappa',
    ['>K'] = '\\Kappa',
    ['>l'] = '\\lambda',
    ['>L'] = '\\Lambda',
    ['>m'] = '\\mu',
    ['>M'] = '\\Mu',
    ['>n'] = '\\nu',
    ['>N'] = '\\Nu',
    ['>x'] = '\\xi',
    ['>X'] = '\\Xi',
    ['>o'] = '\\omicron',
    ['>O'] = '\\Omicron',
    ['>p'] = '\\pi',
    ['>P'] = '\\Pi',
    ['>r'] = '\\rho',
    ['>R'] = '\\Rho',
    ['>s'] = '\\sigma',
    ['>S'] = '\\Sigma',
    ['>ta'] = '\\tau',
    ['>Ta'] = '\\Tau',
    ['>u'] = '\\upsilon',
    ['>U'] = '\\Upsilon',
    ['>f'] = '\\phi',
    ['>F'] = '\\Phi',
    ['>vp'] = '\\varphi',
    ['>c'] = '\\chi',
    ['>C'] = '\\Chi',
    ['>y'] = '\\psi',
    ['>Y'] = '\\Psi',
    ['>w'] = '\\omega',
    ['>W'] = '\\Omega'
}

for trigger,expansion in pairs(automath_snips) do
    table.insert(mySnips, gen_automath(trigger, expansion))
end

return mySnips

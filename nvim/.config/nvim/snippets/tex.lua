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
local fmt = require("luasnip.extras.fmt").fmt
local utils = require("plxg.snippets")

local is_math = utils.in_latex_math
local no_backslash = utils.no_backslash
local pipe = utils.pipe

local automath = function(trig, text)
    return as(
        {trig=trig, snippetType="autosnippet", condition=is_math},
        {
            t(text),
        }
    )
end

local mySnips = {
    -- Template Snippets
    s({trig='probtemp'}, fmta([[\usepackage{titlesec}
\usepackage[many]{tcolorbox}
\newtcbtheorem[]{problem}{}%
    {enhanced,
    colback = black!5, %white,
    colbacktitle = black!5,
    coltitle = black,
    boxrule = 0pt,
    frame hidden,
    borderline west = {0.5mm}{0.0mm}{blue},
    fonttitle = \bfseries\sffamily,
    title=[#1],
    breakable,
    before skip = 3ex,
    after skip = 3ex
}{problem}
\newcommand{\prob}[2]{\begin{problem*}{#1}{} {#2} \end{problem*}}<>]],
    {   i(0),
    })),
    as({trig=';beg'}, fmta("\\begin{<>}<>\n\\end{<>}<>",
    {   i(1, "env"),
        i(2, ""),
        rep(1),
        i(0),
    })),
    as({trig=';al'}, fmta("\\begin{align*} \n    <>\n\\end{align*}<>",
    {
        i(1, ""),
        i(0),
    })),
    as({trig=';pr'},
    fmta("\\prob{<>}{<>}<>",
    {   i(1, ""),
        i(2, ""),
        i(0),
    })),
    as({trig='langle'}, fmta([[\langle <> \rangle <>]],
    {   i(1, "ordered pair"),
        i(0),
    })),

    as({trig=';it'}, fmta([[\item <>]],
    { i(0), })),

    as({trig='$'}, fmta([[$<>$<>]],
    {   i(1),
        i(0)
    })),

    as({trig='_',wordTrig = false, condition = is_math}, fmta([[_{<>}<>]],
    {   i(1),
        i(0)
    })),

    as({trig='^', wordTrig = false, condition = is_math},
        fmta([[^{<>}<>]],
        {   i(1),
            i(0)}
        )
    ),

    as({trig='sqr', wordTrig=false,condition = is_math},
    fmta([[\sqrt{<>}<>]],
    {
        i(1),
        i(0)
    })),
    as({trig='cal', wordTrig=false,condition = is_math},
    fmta([[\mathcal{<>}<>]],
    {
        i(1),
        i(0)
    })),
    as({trig='bb', wordTrig=false, condition = is_math},
    fmta([[\mathbb{<>}<>]],
    {
        i(1),
        i(0)
    })),
    as({trig='fr', wordTrig=false, condition = is_math},
    fmta("\\frac{<>}{<>}<>",
    {   i(1, ""),
        i(2, ""),
        i(0),
    })),
    as({trig='set', condition = is_math, wordTrig = true},
        fmta([[\{<>\}<>]],
        {   i(1, ""),
            i(0)}
        )
    ),
    as({trig='tilde', condition = is_math, wordTrig = true},
        fmta([[\widetilde{<>}<>]],
        {   i(1, ""),
            i(0)}
        )
    ),
    as({trig='hat', condition = is_math, wordTrig = true},
        fmta([[\hat{<>}<>]],
        {   i(1, ""),
            i(0)}
        )
    ),
    as({trig='box', condition = is_math, wordTrig = true},
        fmta([[\boxed{<>}<>]],
        {   i(1, ""),
            i(0)}
        )
    ),
    as({trig='lim', condition = is_math, wordTrig = true},
        fmta([[\lim_{<>}<>]],
        {
            i(1),
            i(0)}
        )
    ),
    as({trig='in ', condition = is_math, wordTrig = true},
        fmta([[\in <>]],
        {
            i(0)}
        )
    ),
    as({trig='int', condition = is_math, wordTrig = true},
        fmta([[\int<>]],
        {
            i(0)}
        )
    ),
    as({trig='to', condition = is_math, wordTrig = true},
        fmta([[\rightarrow <>]],
        {
            i(0)}
        )
    ),
    as({trig='dto', condition = is_math, wordTrig = true},
        fmta([[\xrightarrow{D} <>]],
        {
            i(0)}
        )
    ),
    as({trig='pto', condition = is_math, wordTrig = true},
        fmta([[\xrightarrow{P} <>]],
        {
            i(0)}
        )
    ),
    as({trig='over', condition = is_math, wordTrig = true},
        fmta([[\overrightarrow <>]],
        {
            i(0)}
        )
    ),
    as({trig='ift', condition = is_math, wordTrig = true},
        fmta([[\infty <>]],
        {
            i(0)}
        )
    ),
    as({trig='bar', condition = is_math, wordTrig = true},
        fmta([[\bar{<>}<>]],
        {   
            i(1, ""),
            i(0)}
        )
    ),
    as({trig='bf', condition = is_math, wordTrig = true},
        fmta([[\mathbf{<>}<>]],
        {   i(1, ""),
            i(0)}
        )
    ),
    as({trig='tex', condition = is_math, wordTrig = true},
        fmta([[\textnormal{<>}<>]],
        {   i(1, ""),
            i(0)}
        )
    ),
    as({trig='ceil', condition = is_math, wordTrig = true},
        fmta([[\lceil <>\rceil<>]],
        {   i(1, ""),
            i(0)}
        )
    ),
    as({trig='par', condition = is_math, wordTrig = true},
        fmta([[\left( <>\right)<>]],
        {   i(1, ""),
            i(0)}
        )
    ),
    as({trig='dpr', condition = is_math, wordTrig = true},
        fmta([[\partial <>]],
        {
            i(0)}
        )
    ),
    as({trig='prop', condition = is_math, wordTrig = true},
        fmta([[\propto <>]],
        {
            i(0)}
        )
    ),
    as({trig='brac', condition = is_math, wordTrig = true},
        fmta([[\left[ <>\right]<>]],
        {   i(1, ""),
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
    s(  {trig="cal", name='MathCal', condition=is_math},
        fmta([[\mathcal{<>}<>]],
            {   i(1,"A"),
                i(0),
            }, { delimiters = "<>" }
        )
    ),
    s(  {trig="ex", name='Exists', condition=is_math},
        fmta([[\exists<>]],
            {
                i(0),
            }, { delimiters = "<>" }
        )
    ),

}

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
    ['mu'] = '\\mu',
    ['Mu'] = '\\Mu',
    ['nu'] = '\\nu',
    ['Nu'] = '\\Nu',
    ['>x'] = '\\xi',
    ['>X'] = '\\Xi',
    ['>o'] = '\\omega',
    ['>O'] = '\\Omega',
    ['pi'] = '\\pi',
    ['Pi'] = '\\Pi',
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
    table.insert(mySnips, automath(trigger, expansion))
end

return mySnips

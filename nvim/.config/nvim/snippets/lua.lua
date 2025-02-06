local ls = require("luasnip")
local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

--[
-- dynamic setup
--]
return {
	--[
	-- LuaSnip Snippets
	--]
	-- format snippet
    	s(  {trig="math", name='bruh', dscr=moment}, 
            fmt([[<>,<>]],
                {   c(1, { t("bruh"), t("moment") }),
                    i(0),
                }, { delimiters = "<>" }
            )
        ),
    	s(  {trig="snipf", name='format snippet', dscr='format snippet for luasnip'}, 
            fmt([[<>({ trig='<>', name='<>'}, fmta(<>,{ <> } )<>),<>]],
                {   c(1, { t("s"), t("autosnippet") }),
                    i(2, "trig"),
                    i(3, "trig"),
                    i(4, "fmt"),
                    i(5, "inputs"),
                    i(6, "opts"),
                    i(0),
                }, { delimiters = "<>" }
            )
        ),
	-- simple text snippet
	s(  "snipt",
            fmt([[<>({trig='<>'}, {t('<>')}<><>)<>,]],
		{   c(1, { t("s"), t("autosnippet") }),
		    i(2, "trig"), 
		    i(3, "text"),
		    i(4, "opts"),
		    i(5),
		    i(0), },
		    { delimiters = "<>" }
		)
	), 
        s(  { trig='snipa', name='autosnippet', dscr=''}, 
            fmta(
                [[<>({trig='<>'}, fmta(<>,{ i(<>)})),<>]],
                {   i(1, "as"),
                    i(2, "trig"),
                    i(3, 'fmt'),
                    i(4, "text"),
                    i(0)
                })
        ),
        -- complex node stuff
	as( {trig = "sch", name = "choice node", dscr = "add choice node" },
	    fmt(
                [[c(<>, {<>})]],
                {   i(1), 
                    i(0)  },
                { delimiters = "<>" }
            )
	),
	as( { trig = "snode", name = "snippet node", dscr = "snippet node" },
	    fmt(
                [[sn(<>, {<>})]],
                { i(1, "nil"), i(0) },
                { delimiters = "<>" }
	    )
	),
	-- add snippet conditions
	as( "scond",
	    fmt(
                [[{ condition = <>, show_condition = <> }]], 
                { i(1, "math"), rep(1) },
                { delimiters = "<>" }
            )
	),
	-- special stuff - snippet regex, hide, switch priority
	as( "sreg", { t("regTrig = true, hidden = true") }),
	as( "sprio",
            fmt(
                [[priority = <>]],
                { i(1, "1000") },
                { delimiters = "<>" }
            )
	),
	as("shide", { t("hidden = true") }),
}

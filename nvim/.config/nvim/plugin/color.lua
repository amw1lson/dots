require("gruvbox").setup({
    overrides = {
        ["@lsp.type.parameter"] = { fg = "#8ec07c"}, -- bright_aqua
        ["markdownItalic"] = {fg = "#f2e5bc" },
    }
})
require("colorizer").setup()
vim.cmd[[
"general colo stuff
colo gruvbox
hi Special gui=NONE
hi StatusLine gui=bold 
hi StatusLineNC gui=bold 
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi Normal guibg=NONE ctermbg=NONE  
hi MsgArea guibg=NONE ctermbg=NONE
hi ModeMsg guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
hi Comment gui=NONE
hi @comment gui=NONE
hi CursorLine guibg=NONE
hi CursorLineNr guibg=NONE
hi MatchParen guibg=#2f2f2f guifg=NONE ctermfg=NONE
]]

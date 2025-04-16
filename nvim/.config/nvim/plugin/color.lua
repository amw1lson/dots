require("gruvbox").setup({
    overrides = {
        ["@lsp.type.parameter"] = { fg = "#8ec07c"}, -- bright_aqua
        ["markdownItalic"] = {fg = "#f2e5bc" }
    }
})
require'colorizer'.setup()
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
" hi DiagnosticVirtualTextHint guibg=NONE ctermbg=NONE
" hi DiagnosticVirtualTextInfo guibg=NONE ctermbg=NONE
" hi DiagnosticVirtualTextWarn guibg=NONE ctermbg=NONE
" hi DiagnosticVirtualTextError guibg=NONE ctermbg=NONE
hi Comment gui=NONE
hi @comment gui=NONE
hi CursorLine guibg=NONE
hi CursorLineNr guibg=NONE
hi MatchParen guibg=#2f2f2f guifg=NONE ctermfg=NONE

" hi @property guifg=#4fd6be
" hi @lsp.type.variable guifg=#c0caf5
" hi @constant.builtin guifg=#ff9e64
" hi CursorLineNr guifg=#41a6b5 guibg=NONE ctermbg=NONE
" hi @module guifg=#3d59a1
" hi @lsp.type.namespace guifg=#3d59a1
" colorscheme specific config, everblush
" hi TelescopeSelection guifg=#232a2d guibg=#96d988
" hi LineNr guifg=#434a4d guibg=NONE ctermbg=NONE
" hi @function guifg=#67b0e8
" hi Function guifg=#67b0e8
" hi @keyword.return guifg=#c47fd5
" hi @variable.builtin guifg=#f4d67a
" hi @property guifg=#939393
" hi @parameter guifg=#e57474
" hi Structure guifg=#8ccf7e
" hi @lsp.typemod.variable.functionScope guifg=#efefef
" hi @lsp.typemod.variable.global guifg=#
" hi Constant guifg=#67cbe7
]]

--global
vim.opt.syntax = on
vim.g.netrw_banner = 0
vim.opt.swapfile = false
vim.opt.mouse = "a"
--buffer
vim.opt.expandtab = true
vim.opt.smartindent = true
--window
vim.opt.wrap = false
--other
vim.opt.guicursor = ""
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.hidden = true
vim.opt.ruler = true
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.showmatch = false
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.splitbelow = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.history = 1000
vim.opt.scrolloff = 8
vim.opt.signcolumn = "no"

-- require("no-clown-fiesta").setup(
--     {
--         comments = "NONE",
--     }
-- )
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()

--vim.lsp.set_log_level('debug')

require("plxg.packer")
require("plxg.telescope")
require("plxg.keymap")
vim.cmd([[
nnoremap <SPACE> <Nop>
let mapleader = " "
let maplocalleader = "?"

set backupcopy=yes
set termguicolors
hi StatusLine guifg=#3f3f3f guibg=#bFbFbF 
hi StatusLineNC guifg=#2f2f2f guibg=#9f9f9f
hi Normal guibg=NONE ctermbg=NONE
hi MsgArea guibg=NONE ctermbg=NONE
hi ModeMsg guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
hi CursorLine guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi DiagnosticError guibg=NONE ctermbg=NONE
hi DiagnosticWarn guibg=NONE ctermbg=NONE
"set colorcolumn=80
"hi ColorColumn guibg=#2f2f2f
let g:UltiSnipsExpandTrigger = ",,"
let g:UltiSnipsJumpForwardTrigger = ",,"
let g:UltiSnipsListSnippets = ""
let g:UltiSnipsSnippetDirectories=["/home/austin/.config/nvim/UltiSnips"]
let g:vimtex_view_forward_search_on_start = 0
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
"gdb
packadd termdebug

" clipboard
set clipboard+=unnamedplus
]])

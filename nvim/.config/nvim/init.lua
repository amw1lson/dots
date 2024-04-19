--global
vim.opt.syntax = on
vim.g.netrw_banner = 0
vim.opt.swapfile = false
vim.opt.mouse = "a"--buffer
vim.opt.expandtab = true
vim.opt.smartindent = true
--window
vim.opt.wrap = false
--other
vim.opt.guicursor = ""
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 2
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
vim.opt.termguicolors = true

require("plxg.packer")
require("plxg.telescope")
require("plxg.keymap")
--vim.lsp.set_log_level("debug")

require('colorizer').setup()

vim.cmd([[
nnoremap <SPACE> <Nop>
let mapleader = " "
let maplocalleader = "?"
" set nocursorline
colo everblush
set backupcopy=yes
hi Special gui=NONE
hi StatusLine gui=bold 
hi StatusLineNC gui=bold 
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi Normal guibg=NONE ctermbg=NONE  
hi MsgArea guibg=NONE ctermbg=NONE
hi ModeMsg guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
hi DiagnosticVirtualTextHint guifg=#52be65  guibg=NONE ctermbg=NONE
hi DiagnosticVirtualTextInfo guifg=#bfbfbf  guibg=NONE ctermbg=NONE
hi DiagnosticVirtualTextWarn guifg=#fff07c  guibg=NONE ctermbg=NONE
hi DiagnosticVirtualTextError guifg=#ed474a guibg=NONE ctermbg=NONE
hi Comment gui=NONE
hi @comment gui=NONE
" hi TelescopeSelection guifg=#232a2d guibg=#96d988
hi CursorLineNr guifg=#76b968 guibg=NONE ctermbg=NONE
hi LineNr guifg=#434a4d guibg=NONE ctermbg=NONE
hi CursorLine guibg=NONE
hi @function guifg=#67b0e8
hi Function guifg=#67b0e8
hi @keyword.return guifg=#c47fd5
hi @variable.builtin guifg=#f4d67a
hi @property guifg=#838383
hi @parameter guifg=#e57474
hi Structure guifg=#8ccf7e
hi @lsp.typemod.variable.functionScope guifg=#dfdfdf
hi Constant guifg=#67cbe7
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
"gdb
packadd termdebug

" clipboard
set clipboard+=unnamedplus
]])

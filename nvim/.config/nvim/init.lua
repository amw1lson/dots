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
vim.opt.termguicolors = true

vim.lsp.set_log_level('debug')

require("plxg.packer")
require("plxg.telescope")
require("plxg.keymap")

require('colorizer').setup()

vim.cmd([[
nnoremap <SPACE> <Nop>
let mapleader = " "
let maplocalleader = "?"

colorscheme oxocarbon
set backupcopy=yes

hi StatusLine gui=bold guifg=#3ddbd9 guibg=#0b0b0b
hi StatusLineNC gui=bold guibg=#212121
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi Normal guibg=NONE ctermbg=NONE
hi MsgArea guibg=NONE ctermbg=NONE
hi ModeMsg guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
hi CursorLine guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi CursorLineNr guibg=NONE ctermbg=NONE
hi DiagnosticVirtualTextHint guifg=#52be65 guibg=NONE ctermbg=NONE
hi DiagnosticVirtualTextInfo guifg=#bfbfbf guibg=NONE ctermbg=NONE
hi DiagnosticVirtualTextWarn guifg=#fff07c guibg=NONE ctermbg=NONE
hi DiagnosticVirtualTextError guifg=#ed474a guibg=NONE ctermbg=NONE
hi @comment gui=NONE
" set colorcolumn=80
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

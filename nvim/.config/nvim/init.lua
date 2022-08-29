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
vim.opt.splitbelow = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.history = 1000
vim.opt.scrolloff = 8
vim.opt.signcolumn = "no"

require("plxg.packer")
require("plxg.telescope")
require("plxg.keymap")

vim.cmd([[
nnoremap <SPACE> <Nop>
let mapleader = " "
let maplocalleader = "?"

set termguicolors
colorscheme bloodred
let g:UltiSnipsExpandTrigger = ",,"
let g:UltiSnipsJumpForwardTrigger = ",,"
let g:UltiSnipsListSnippets = ""
let g:UltiSnipsSnippetDirectories=["/home/austin/.config/nvim/UltiSnips"]

"gdb
packadd termdebug

" clipboard
set clipboard+=unnamedplus
]])

--global
vim.g.netrw_banner = 0
vim.opt.swapfile = false
vim.opt.mouse = "a"
vim.opt.guicursor = ""
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.ruler = true
vim.opt.showmatch = false
vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.splitbelow = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.history = 1000
vim.opt.scrolloff = 8
vim.opt.signcolumn = "no"
vim.opt.termguicolors = true


require("plxg.packer")
require("plxg.telescope")
require("plxg.keymap")
require("nvim-autopairs").setup()

vim.cmd([[
nnoremap <SPACE> <Nop>
let mapleader = " "
let maplocalleader = "?"
set backupcopy=yes
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
" clipboard
set clipboard+=unnamedplus
set cursorline
" syntax enable
" filetype plugin indent on
]])

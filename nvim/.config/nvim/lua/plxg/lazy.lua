local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.cmd([[
nnoremap <SPACE> <Nop>
let mapleader = " "
let maplocalleader = "?"
set backupcopy=yes
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
" clipboard
set clipboard+=unnamedplus
set cursorline
syntax enable
filetype plugin indent on
set completeopt=menu,menuone,noselect,noinsert
filetype plugin on
]])

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


return require('lazy').setup({
    -- aesthetics
    {'ellisonleao/gruvbox.nvim'},
    {'norcalli/nvim-colorizer.lua'},
    {'nvim-lualine/lualine.nvim'},
    {'KeitaNakamura/tex-conceal.vim'},
    {'HiPhish/rainbow-delimiters.nvim'},

    -- reqs
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'},

    -- lsp
    {'williamboman/mason.nvim'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {'hrsh7th/nvim-cmp'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},
    {'onsails/lspkind.nvim'},
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    { 'lervag/vimtex' },

    -- convenience
    { 'echasnovski/mini.surround', version = false },
    { 'windwp/nvim-autopairs' },
    { 'numToStr/Comment.nvim'},
    {'ggandor/leap.nvim'},
    {'ThePrimeagen/harpoon'},
    {
        "kawre/neotab.nvim",
        event = "InsertEnter",
        opts = { },
    },
    {
            'L3MON4D3/LuaSnip',
            -- follow latest release.
            tag = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!:).
            build = 'make install_jsregexp'
    },
    { 'saadparwaiz1/cmp_luasnip' },
    {
        "folke/flash.nvim",
        opts = {},
    },

    -- telescope
    {'nvim-telescope/telescope.nvim'},
    {'nvim-telescope/telescope-fzy-native.nvim'},
    {'nvim-telescope/telescope-ui-select.nvim' },
})

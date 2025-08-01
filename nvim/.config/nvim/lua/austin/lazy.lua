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
    { 'ellisonleao/gruvbox.nvim' },
    { 'nvim-lualine/lualine.nvim' },
    { 'HiPhish/rainbow-delimiters.nvim' },

    -- reqs
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'onsails/lspkind.nvim' },

    -- lsp
    { 'williamboman/mason.nvim' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },

    { 'lervag/vimtex' },
    -- convenience
    { 
        'echasnovski/mini.surround', version = false, 
        opts = {
            custom_surroundings = {
              -- Make `)` insert parts with spaces. `input` pattern stays the same.
              ['{'] = { output = { left = '{', right = '}' } },
              ['l'] = { output = { left = '\\left(', right = '\\right)' } },
              ['L'] = { output = { left = '\\left[', right = '\\right]' } },
              ['B'] = { output = { left = '{', right = '}' } },
              ['a'] = { output = { left = '<', right = '>' } },
            },
        }
    },

    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true,
        opts = {
            ignored_next_char = '[%w%.]', -- will ignore alphanumeric and `.` symbol
        },
    },

    {
        'numToStr/Comment.nvim',
        opts = {
            opleader = {
                line = '-',
            },
        }
    },
    {
        'kawre/neotab.nvim',
        event = "InsertEnter",
        opts = {
            tabkey = "",
            pairs = { ---@type ntab.pair[]
                { open = "(", close = ")" },
                { open = "[", close = "]" },
                { open = "{", close = "}" },
                { open = "'", close = "'" },
                { open = '"', close = '"' },
                { open = "`", close = "`" },
                { open = "<", close = ">" },
                { open = "$", close = "$" },
            },
        },
    },

    { 'L3MON4D3/LuaSnip', },
    { 'saadparwaiz1/cmp_luasnip' },

    { 'nvim-treesitter/nvim-treesitter', },
    {
        'nvim-treesitter/nvim-treesitter-context',
        opts = {
            max_lines=5,
        },
    },
    { 'ThePrimeagen/harpoon' },
    -- telescope
    { 'nvim-telescope/telescope.nvim' },
    { 'nvim-telescope/telescope-fzy-native.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim'  },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
})

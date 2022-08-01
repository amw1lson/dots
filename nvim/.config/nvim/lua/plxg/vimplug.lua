local Plug = vim.fn['plug#']

vim.call("plug#begin")
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'lervag/vimtex'
Plug 'dense-analysis/ale'
Plug 'ycm-core/YouCompleteMe'
Plug 'morhetz/gruvbox'
Plug 'xero/blaquemagick.vim'
Plug('itsook/ok.nvim', {as = 'ok'})
Plug 'norcalli/nvim-colorizer.lua'
Plug 'kyazdani42/nvim-web-devicons'
vim.call("plug#end")

require('colorizer').setup()

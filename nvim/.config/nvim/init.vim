syntax on

set expandtab
set shiftwidth=4
set hidden
set ruler
set nocompatible
set showmode
set splitbelow
set showcmd
set showmatch
set noerrorbells
set autoindent
filetype plugin indent on
set smartindent
set hlsearch
set incsearch
set ignorecase
set smartcase
set history=1000
set scrolloff=6
set noswapfile
set nowrap
set relativenumber
set number

set guicursor =
set mouse=a

"highlight ColorColumn ctermbg=red 
"set colorcolumn=80

au BufNewFile,BufRead *.md set filetype=markdown
au FileType markdown set wrap

nnoremap <SPACE> <Nop>
let mapleader = " "
let maplocalleader = ","

call plug#begin()
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'preservim/nerdtree'
Plug 'lervag/vimtex'
Plug 'dense-analysis/ale'
Plug 'ycm-core/YouCompleteMe'
Plug 'morhetz/gruvbox'
Plug 'xero/blaquemagick.vim'
Plug 'itsook/ok.nvim', {'as':'ok'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

set termguicolors
colorscheme 256_noir


"gdb
packadd termdebug

" clipboard
set clipboard+=unnamedplus

lua require("plxg")

lua << EOF
return require('packer').startup(function()
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }
end)
EOF
lua require'colorizer'.setup()

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

nnoremap <SPACE> <Nop>
let mapleader = " "
let maplocalleader = ","

set termguicolors
colorscheme 256_noir


"gdb
packadd termdebug

" clipboard
set clipboard+=unnamedplus

lua require("plxg.vimplug")
lua require("plxg.telescope")

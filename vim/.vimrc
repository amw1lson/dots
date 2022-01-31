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
set smartindent
set nohlsearch
set incsearch
set ignorecase
set smartcase
set history=1000
set scrolloff=6
set noswapfile
set nowrap
set relativenumber
set number
colorscheme sourcerer
set cursorline
hi Cursorline ctermfg=none cterm=none guifg=NONE
set guicursor=
set statusline=%f

nnoremap <SPACE> <Nop>
let mapleader = " "

call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'
Plug 'ajh17/vimcompletesme'
call plug#end()

" nerdtree stuff
au VimEnter * NERDTree
au BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let NERDTreeShowHidden=1

" Telescope Remaps
nnoremap <C-p> :Telescope find_files<CR>
nnoremap fb :Telescope buffers<cr>

" term stuff
nnoremap <leader>t :split \| resize 15 \| terminal<CR>
tnoremap <Esc> <C-\><C-n>

" don't need no arrow keys 
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

"window remaps
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" ocaml stuff
set rtp+=/home/austin/.opam/default/share/merlin/vim

" latex
au FileType tex nnoremap I :! pdflatex %<CR><CR>
au FileType tex nnoremap S :! zathura $(echo % \| sed 's/tex$/pdf/') & disown<CR>



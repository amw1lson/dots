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
colorscheme synthblack

hi StatusLine ctermbg=blue ctermfg=lightblue
set statusline=%f
set cursorline

set guicursor=

highlight ColorColumn ctermbg=red ctermfg=white
set colorcolumn=80

au BufNewFile,BufRead *.md set filetype=markdown
au FileType markdown set wrap

nnoremap <SPACE> <Nop>
let mapleader = " "

call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'
Plug 'lervag/vimtex'
Plug 'ajh17/vimcompletesme'
Plug 'SirVer/ultisnips'
call plug#end()

" nerdtree stuff
au VimEnter * NERDTree
au BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
au BufWinEnter * NERDTreeMirror
let NERDTreeShowHidden=1

" Telescope Remaps
nnoremap <C-p> :Telescope find_files<CR>
nnoremap fb :Telescope buffers<cr>
" deoplete
let g:UltiSnipsExpandTrigger="<c-s>"
" term stuff
nnoremap <leader>t :split \| resize 15 \| terminal<CR>
tnoremap <Esc> <C-\><C-n>

" tab stuff
nnoremap <Tab> gt
nnoremap <silent> <A-t> :tabnew<CR>
nnoremap <silent> <S-Tab> :tabmove +<CR>
nnoremap <silent> <A-Tab> :tabmove -<CR>

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
au FileType ocaml set shiftwidth=2 

" latex
au FileType tex map I :!pdflatex %<CR><CR>
au FileType tex map S :!zathura $(echo % \| sed 's/tex$/pdf/') & disown<CR>
let g:tex_flavor = "latex"

" compiling
nnoremap <leader>r :split \| resize 15 \| term R -s -f %<CR>

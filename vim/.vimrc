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
Plug 'dense-analysis/ale'
Plug 'dylanaraps/wal.vim'
"Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()
"colorscheme wal

hi StatusLine ctermbg=lightgrey ctermfg=black
set statusline=%f

" nerdtree stuff
"au VimEnter * NERDTreDTree
"au BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"au BufWinEnter * NERDTreeMirror
nnoremap <C-p> :NERDTree<cr>
let NERDTreeShowHidden=1

"synstastic
"let g:syntastic_ocaml_checkers = ['merlin']
"let g:syntastic_cpp_checkers = ['gcc']
"let g:syntastic_c_checkers = ['gcc']
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"ale
highlight ALEWarning ctermbg=109
highlight ALEError ctermbg=88

"VimCompletesMe
filetype plugin on
"set omnifunc=syntaxcomplete#Complete

" Telescope Remaps
"nnoremap <C-p> :Telescope find_files<CR>
nnoremap fb :Telescope buffers<cr>

" term stuff
nnoremap <leader>t :split \| resize 15 \| terminal<CR>
tnoremap <Esc> <C-\><C-n>

" autocompile
au FileType c nnoremap <F5> :w<CR> :!gcc -g % -o %< <CR>
au FileType c nnoremap <F8> :w<CR> :!gcc -g % -o %< && ./%< 
au FileType cpp nnoremap <F5> :w<CR> :!g++ -g % -o %< <CR>
au FileType cpp nnoremap <F8> :w<CR> :!g++ -g % -o %< && ./%< 
au FileType ocaml nnoremap <F5> :w<CR> :!ocamlbuild -use-ocamlfind %<.byte <CR>
au FileType ocaml nnoremap <F8> :w<CR> :!ocamlbuild -use-ocamlfind %<.byte && ./%<.byte


" tab stuff
nnoremap <Tab> gt
nnoremap <silent> <A-t> :tabnew<CR>
nnoremap <silent> <S-Tab> :tabmove +<CR>
nnoremap <silent> <A-Tab> :tabmove -<CR>

"gdb
packadd termdebug

" clipboard
set clipboard+=unnamedplus

"window remaps
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>H :wincmd H<CR> 
nnoremap <leader>K :wincmd K<CR> 
nnoremap <leader>J :wincmd J<CR> 
nnoremap <leader>L :wincmd L<CR> 

" ocaml stuff
"set rtp+=/home/austin/.opam/default/share/merlin/vim
au FileType ocaml set shiftwidth=2 

" latex
au FileType tex map I :!pdflatex %<CR><CR>
au FileType tex map S :!zathura $(echo % \| sed 's/tex$/pdf/') & disown<CR>
let g:tex_flavor = "latex"

" compiling
nnoremap <leader>r :split \| resize 15 \| term R -s -f %<CR>

" Merlin
"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line

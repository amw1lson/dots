" nerdtree stuff
nnoremap <C-n> :NERDTree<cr>
let NERDTreeShowHidden=1

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

nnoremap <leader>N :bnext<cr>
nnoremap <leader>P :bprev<cr>


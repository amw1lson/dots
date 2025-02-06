filetype plugin indent on
syntax enable
autocmd BufNewFile,BufRead *.md so $VIMRUNTIME/syntax/tex.vim
let maplocalleader = ","
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_forward_search_on_start = 0
let g:vimtex_quickfix_mode = 0
let g:vim_markdown_math = 1
let g:tex_conceal='abdmg'
set conceallevel=1
hi Conceal gui=bold guifg=#a9b1d6 guibg=NONE ctermbg=NONE

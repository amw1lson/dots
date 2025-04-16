filetype plugin indent on
syntax enable
autocmd BufNewFile,BufRead *.md so $VIMRUNTIME/syntax/tex.vim
let g:vimtex_indent_enabled = 1
let maplocalleader = ","
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_forward_search_on_start = 0
let g:vimtex_quickfix_mode = 0
let g:vim_markdown_math = 1
let g:tex_conceal='abdmg'
set conceallevel=1
hi Conceal gui=bold guifg=#a9b1d6 guibg=NONE ctermbg=NONE

" if exists("g:loaded_fix_indentkeys")
"     finish
" endif

" let g:loaded_fix_indentkeys = 1

" Set indentkeys option again on changed filetype option.
" This fixes TeX \item indentation in combination with YouCompleteMe.
" See https://github.com/Valloric/YouCompleteMe/issues/1244
" You may add more filetypes if necessary.
" autocmd FileType tex,plaintex execute "setlocal indentkeys="&indentkeys

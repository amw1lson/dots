" vimtex"
"au FileType tex map I :!pdflatex %<CR><CR>
"au FileType tex map S :!zathura $(echo % \| sed 's/tex$/pdf/') & disown<CR>
let g:tex_flavor = "latex"
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
au BufWinLeave *.tex VimtexStop
au BufWinLeave *.tex VimtexClean

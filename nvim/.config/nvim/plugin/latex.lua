vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_method = 'latexmk'
vim.cmd([[
au BufWinLeave *.tex VimtexStop
au BufWinLeave *.tex VimtexClean
]])

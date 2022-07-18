"ale
highlight ALEWarning ctermbg=88
highlight ALEError ctermbg=88
highlight ALEErrorSign ctermbg=88
highlight ALEWarningSign ctermbg=88

let g:ycm_auto_hover = 'CursorHold'
nnoremap <leader>D <plug>(YCMHover)

augroup MyYCMCustom
  autocmd!
  autocmd FileType c,cpp let b:ycm_hover = {
    \ 'command': 'GetDoc',
    \ 'syntax': &filetype
    \ }
augroup END

"VimCompletesMe
filetype plugin on
set omnifunc=syntaxcomplete#Complete


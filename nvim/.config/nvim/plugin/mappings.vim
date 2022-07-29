nnoremap <leader>n :cnext<cr>
nnoremap <leader>p :cprev<cr>
nnoremap <C-j> :lnext<cr>
nnoremap <C-k> :lprev<cr>
nnoremap <C-q> :call ToggleQFList(0)<CR>
nnoremap <leader>q :call ToggleQFList(1)<CR>
nnoremap <leader>e :Ex<CR>

let g:plxg_qf_l = 0
let g:plxg_qf_g = 0

fun! ToggleQFList(global)
    if a:global
        if g:plxg_qf_g == 1
            let g:plxg_qf_g = 0
            cclose
        else
            let g:plxg_qf_g = 1
            copen
        end
    else
        if g:plxg_qf_l == 1
            let g:plxg_qf_l = 0
            lclose
        else
            let g:plxg_qf_l = 1
            lopen
        end
    endif
endfun

" term stuff
nnoremap <leader>t :split \| resize 10 \| terminal<CR>
tnoremap <Esc> <C-\><C-n>

" autocompile
au FileType c nnoremap <F5> :w<CR> :split \| term gcc -g % -o %< <CR>
au FileType c nnoremap <F8> :w<CR> :split \| term gcc -g % -o %< && ./%< <CR>
au FileType cpp nnoremap <F5> :w<CR> :split \| term g++ -g % -o %< <CR>
au FileType cpp nnoremap <F8> :w<CR> :split \| term g++ -g % -o %< && ./%< <CR>
au FileType ocaml nnoremap <F5> :w<CR> :split \| term ocamlbuild -use-ocamlfind %<.byte <CR>
au FileType ocaml nnoremap <F8> :w<CR> :split \| term ocamlbuild -use-ocamlfind %<.byte && ./%<.byte

"templates
au BufNewFile *.c 0r ~/.vim/templates/template.c

" tab stuff
nnoremap <Tab> gt
nnoremap <silent> <A-t> :tabnew<CR>
nnoremap <silent> <S-Tab> :tabmove +<CR>
nnoremap <silent> <A-Tab> :tabmove -<CR>

"window remaps
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>H :wincmd H<CR> 
nnoremap <leader>K :wincmd K<CR> 
nnoremap <leader>J :wincmd J<CR> 
nnoremap <leader>L :wincmd L<CR> 

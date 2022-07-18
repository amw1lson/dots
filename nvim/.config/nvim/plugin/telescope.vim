" Telescope Remaps
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <leader>gf :lua require('telescope.builtin').git_files()<CR> 
nnoremap <leader>bf :Telescope buffers<cr>
nnoremap <leader>gs :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>gl :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fx :lua require('telescope.builtin').quickfix()<cr>

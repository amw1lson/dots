set completeopt=menu,menuone,noselect,noinsert

"sign define DiagnosticSignWarn texthl=DiagnosticSignWarn
"sign define DiagnosticSignInfo texthl=DiagnosticSignInfo
"sign define DiagnosticSignHint texthl=DiagnosticSignHint
"sign define DiagnosticSignError texthl=DiagnosticSignError

nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vs :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrf :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap K :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vc :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vn :lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>vp :lua vim.diagnostic.goto_prev()<CR>

filetype plugin on


local nnoremap = require("plxg.keymap").nnoremap
local vnoremap = require("plxg.keymap").vnoremap
local tnoremap = require("plxg.keymap").tnoremap
local inoremap = require("plxg.keymap").inoremap
local nmap = require("plxg.keymap").nmap
local ls = require("luasnip")

--lsp config options
vim.cmd([[
set completeopt=menu,menuone,noselect,noinsert
filetype plugin on
]])

--lsp mappings
nnoremap("<leader>vi", function() vim.lsp.buf.implementation() end)
nnoremap("<leader>gd", function() vim.lsp.buf.definition() end)
nnoremap("<leader>vs", function() vim.lsp.buf.signature_help() end)
nnoremap("<leader>vrf", function() vim.lsp.buf.references() end)
nnoremap("<leader>vf", function() vim.lsp.buf.format() end)
nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
nnoremap("K", function() vim.lsp.buf.hover() end)
nnoremap("<leader>vc", function() vim.lsp.buf.code_action() end)
nnoremap("<leader>vn", function() vim.diagnostic.goto_next() end)
nnoremap("<leader>vp", function() vim.diagnostic.goto_prev() end)
nnoremap("<leader>vd", ":Telescope lsp_document_symbols<CR>")
nnoremap("<leader>vw", ":Telescope lsp_workspace_symbols<CR>")

-- buffer movement
nnoremap("<leader>N", ":bnext<cr>")
nnoremap("<leader>P", ":bprev<cr>")

--the keybind of all keybinds
vim.keymap.set("x", "<leader>p", [["_dP]])

--telescope
nnoremap("<leader>gb", ":Telescope buffers<cr>")
nnoremap("<C-p>", function() require('telescope.builtin').find_files() end)
nnoremap("<leader>gf", function() require('telescope.builtin').git_files() end)
nnoremap("<leader>gl", function() require('telescope.builtin').live_grep() end)
nnoremap("<leader>gs", function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ") }) end)
nnoremap("<leader>e",":Lex | vertical resize 30<CR>")

--term stuff
nnoremap("<leader>t", ":split | resize 10 | terminal<CR>")
tnoremap("<Esc>", "<C-\\><C-n><CR>")

--window remaps
nnoremap("<leader>h", ":wincmd h<CR>")
nnoremap("<leader>j", ":wincmd j<CR>")
nnoremap("<leader>k", ":wincmd k<CR>")
nnoremap("<leader>l", ":wincmd l<CR>")
-- nnoremap("<leader>H", ":wincmd H<CR>")
-- nnoremap("<leader>J", ":wincmd J<CR>")
-- nnoremap("<leader>K", ":wincmd K<CR>")
-- nnoremap("<leader>L", ":wincmd L<CR>")

--common binding
inoremap("<C-BS>", "<C-w>")

--buffers
nnoremap("<leader>D", ":bd!<CR>")

--move text
vnoremap("J", ":move '>+1<CR>gv=gv<CR>")
vnoremap("K", ":move '<-2<CR>gv=gv<CR>")

--vertical movement
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")

-- horizontal movement
nnoremap("H", "0")
nnoremap("L", "$")
vnoremap("H", "0")
vnoremap("L", "$")

-- leap
require('leap').add_default_mappings()

-- obsidian.nvim
nnoremap("<leader>ba", ":ObsidianBacklinks<CR>")

-- harpoon mappings
local silent = { silent = true }

nnoremap("<leader>na", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<leader>ns", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("<leader>nd", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("<leader>nf", function() require("harpoon.ui").nav_file(4) end, silent)

nnoremap("<leader>m", function() require("harpoon.mark").add_file() end)
nnoremap("<leader>a", function() require("harpoon.ui").toggle_quick_menu() end)
nnoremap("<leader>c", function() require("harpoon.cmd-ui").toggle_quick_menu() end)

-- snippets
vim.keymap.set("i", "<C-k>", function()
    require("luasnip.extras.select_choice")()
end, silent)
vim.api.nvim_set_keymap("i", "<C-f>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-f>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("i", "<C-F>", "<Plug>luasnip-prev-choice", {})
vim.api.nvim_set_keymap("s", "<C-F>", "<Plug>luasnip-prev-choice", {})

-- vim.keymap.set({"i"}, "<Tab>", function() ls.expand() end, {silent = true})
vim.cmd("imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'")
vim.cmd("inoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>")
nnoremap("<leader>vw", ":Telescope lsp_workspace_symbols<CR>")

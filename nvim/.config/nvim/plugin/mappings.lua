local nnoremap = require("plxg.keymap").nnoremap
local vnoremap = require("plxg.keymap").vnoremap
local tnoremap = require("plxg.keymap").tnoremap
local inoremap = require("plxg.keymap").inoremap
local cnoremap = require("plxg.keymap").cnoremap
local nmap = require("plxg.keymap").nmap
local ls = require("luasnip")

--lsp mappings
nnoremap("K", function() vim.lsp.buf.hover() end)
nnoremap("<leader>ga", function () vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.lsp.buf.format({ async = false })
    end
}) end)
nnoremap("<leader>gc", function() vim.lsp.buf.code_action() end)
nnoremap("<leader>gd", function() vim.lsp.buf.definition() end)
nnoremap("<leader>ge", function() vim.diagnostic.setqflist() end)
nnoremap("<leader>gf", function() vim.lsp.buf.format() end)
nnoremap("<leader>gi", function() vim.lsp.buf.implementation() end)
nnoremap("<leader>gm", function() vim.lsp.buf.rename() end)
nnoremap("<leader>gn", function() vim.diagnostic.goto_next() end)
nnoremap("<leader>gp", function() vim.diagnostic.goto_prev() end)
nnoremap("<leader>gr", function() vim.lsp.buf.references() end)
nnoremap("<leader>gs", function() vim.lsp.buf.signature_help() end)

--telescope
nnoremap("<leader>gl", function() require('telescope.builtin').live_grep() end)
nnoremap("<leader>gz", function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ") }) end)

-- buffer movement
nnoremap("<leader>N", ":bnext<cr>")
nnoremap("<leader>P", ":bprev<cr>")

--the keybind of all keybinds
vim.keymap.set("x", "<leader>p", [["_dP]])

nnoremap("<C-f>", function() require('telescope.builtin').find_files() end)
nnoremap("<leader>e",":Lex | vertical resize 30<CR>")
--qflists
nnoremap("<C-n>", ":cn<CR>")
nnoremap("<C-p>", ":cp<CR>")
nnoremap("<leader>cc", ":ccl<CR>")
nnoremap("<leader>co", ":cope<CR>")

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
cnoremap("<C-BS>", "<C-w>")

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
-- require('leap').add_default_mappings()
vim.keymap.set({'n', 'x', 'o'}, 'z', '<Plug>(leap)')
vim.keymap.set('n',             'Z', '<Plug>(leap-from-window)')

--mini.surround
nnoremap("saB", "sa{")

-- harpoon mappings
local silent = { silent = true }

nnoremap("<leader>na", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<leader>ns", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("<leader>nd", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("<leader>nf", function() require("harpoon.ui").nav_file(4) end, silent)

nnoremap("<leader>m", function() require("harpoon.mark").add_file() end)
nnoremap("<leader>a", function() require("harpoon.ui").toggle_quick_menu() end)
nnoremap("<leader>u", function() require("harpoon.cmd-ui").toggle_quick_menu() end)

-- snippets
vim.keymap.set("i", "<C-k>", function() require("luasnip.extras.select_choice")() end, silent)
vim.api.nvim_set_keymap("i", "<C-f>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-f>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("i", "<C-F>", "<Plug>luasnip-prev-choice", {})
vim.api.nvim_set_keymap("s", "<C-F>", "<Plug>luasnip-prev-choice", {})

-- vim.keymap.set({"i"}, "<Tab>", function() ls.expand() end, {silent = true})
-- vim.cmd("imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'")
inoremap("<Tab>", function()
    if require('luasnip').expand_or_jumpable() then
        require('luasnip').expand_or_jump()
    else
        require('neotab').tabout()
    end
end, silent)
vim.cmd("inoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>")
nnoremap("<leader>vw", ":Telescope lsp_workspace_symbols<CR>")

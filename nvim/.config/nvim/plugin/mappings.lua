--the keybind of all keybinds
vim.keymap.set("x", "<leader>p", [["_dP]])

--window remaps
vim.keymap.set('n', "<C-h>", ":wincmd h<CR>")
vim.keymap.set('n', "<C-j>", ":wincmd j<CR>")
vim.keymap.set('n', "<C-k>", ":wincmd k<CR>")
vim.keymap.set('n', "<C-l>", ":wincmd l<CR>")

--move text
vim.keymap.set('v', "J", ":move '>+1<CR>gv")
vim.keymap.set('v', "K", ":move '<-2<CR>gv")
vim.keymap.set('n', "H", "0")
vim.keymap.set('n', "L", "$")
vim.keymap.set('v', "H", "0")
vim.keymap.set('v', "L", "$")

--vertical movement
vim.keymap.set('n', "<C-u>", "<C-u>zz")
vim.keymap.set('n', "<C-d>", "<C-d>zz")

--comments
vim.keymap.set({"x","o"}, ",", "gc",  { remap = true, silent = true })
vim.keymap.set("n", ",", "gcc", { remap = true, silent = true })

vim.keymap.set('i', "<C-BS>", "<C-w>")
vim.keymap.set('c', "<C-BS>", "<C-w>")

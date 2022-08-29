local nnoremap = require("plxg.keymap").nnoremap

local silent = { silent = true }


nnoremap("<C-a>", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<C-s>", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("<C-d>", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("<C-f>", function() require("harpoon.ui").nav_file(4) end, silent)

nnoremap("<leader>m", function() require("harpoon.mark").add_file() end)
nnoremap("<leader>a", function() require("harpoon.ui").toggle_quick_menu() end)
nnoremap("<leader>c", function() require("harpoon.cmd-ui").toggle_quick_menu() end)

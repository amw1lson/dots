local nnoremap = require("plxg.keymap").nnoremap

local silent = { silent = true }


nnoremap("<leader>pa", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<leader>ps", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("<leader>pd", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("<leader>pf", function() require("harpoon.ui").nav_file(4) end, silent)

nnoremap("<leader>m", function() require("harpoon.mark").add_file() end)
nnoremap("<leader>a", function() require("harpoon.ui").toggle_quick_menu() end)
nnoremap("<leader>c", function() require("harpoon.cmd-ui").toggle_quick_menu() end)

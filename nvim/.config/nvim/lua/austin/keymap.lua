local M = {}

local function bind(op, outer_opts)
    outer_opts = outer_opts or { noremap = true }
    return function(lhs, rhs, opts)
        local new_opts = vim.tbl_extend("force",
            outer_opts or {},
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, new_opts)
    end
end

M.nmap = bind("n", { noremap = false })
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")
M.tnoremap = bind("t")
M.cnoremap = bind("c")

return M

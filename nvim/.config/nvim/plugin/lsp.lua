local nnoremap = require("austin.keymap").nnoremap
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("mason").setup()
require("mason-lspconfig").setup()

vim.diagnostic.config {
    underline = false,
    virtual_text = true
}

local lsp_defaults = {
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
    ),
    on_attach = function(client, bufnr)
    end,
    root_dir = function() return vim.fn.getcwd() end
}


lspconfig.util.default_config = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config,
    lsp_defaults
)

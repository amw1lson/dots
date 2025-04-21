local nnoremap = require("plxg.keymap").nnoremap
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

-- Setup lspconfig.


lspconfig.clangd.setup {
    -- cmd = { "/opt/clangd_18.1.3/bin/clangd" },
    cmd = { "clangd" },
    on_attach = function(client, bufnr)
        -- client.server_capabilities.semanticTokensProvider = vim.NIL
        nnoremap("<C-h>", ":ClangdSwitchSourceHeader<CR>")
    end,
    capabilities = capabilities
}

lspconfig.texlab.setup{
    on_attach = lsp_defaults.on_attach,
    capabilities = lsp_defaults.capabilities,
    settings = {
          texlab = {
            auxDirectory = ".",
            bibtexFormatter = "texlab",
            build = {
              args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
              executable = "latexmk",
              forwardSearchAfter = false,
              onSave = true
            },
            chktex = {
              onEdit = false,
              onOpenAndSave = false
            },
            diagnosticsDelay = 300,
            formatterLineLength = 80,
            forwardSearch = {
              args = {}
            },
            latexFormatter = "latexindent",
            latexindent = {
              modifyLineBreaks = false
            }
          }
    }
}
vim.cmd([[
let g:vimtex_indent_lists = []
]])

lspconfig.pyright.setup {
    on_attach = lsp_defaults.on_attach,
    capabilities = lsp_defaults.capabilities
}

lspconfig.lua_ls.setup {
  on_init = function(client)
    return true
  end
}

local nnoremap = require("plxg.keymap").nnoremap

vim.diagnostic.config {
    underline = false
}

require("mason").setup()
require("mason-lspconfig").setup()

local lsp_defaults = {
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
    ),
    on_attach = function(client, bufnr)
        --vim.api.nvim_command('set updatetime=100')
        --vim.api.nvim_command('autocmd CursorHold * :lua vim.lsp.buf.hover({focusable = false})')
        vim.api.nvim_command('autocmd BufWritePre * :lua vim.lsp.buf.format()')
    end
}

local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config,
    lsp_defaults
)

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
lspconfig.sumneko_lua.setup({
    on_attach = lsp_defaults.on_attach,
    capabilities = capabilities
})

lspconfig.clangd.setup {
    on_attach = function()
        nnoremap("<C-h>", ":ClangdSwitchSourceHeader<CR>")
    end,
    capabilities = capabilities
}


lspconfig.arduino_language_server.setup {
    cmd = {
        "arduino-language-server",
        "-cli-config", "/home/austin/.arduino15/arduino-cli.yaml",
        "-fqbn", "esp32:esp32:heltec_wifi_kit_32",
        "-cli", "/usr/bin/arduino-cli",
        "-clangd", "/usr/bin/clangd"
    }
}

lspconfig.texlab.setup {
    on_attach = lsp_defaults.attach,
    capabilities = lsp_defaults.capabilities
}

lspconfig.pyright.setup {
    on_attach = lsp_defaults.attach,
    capabilities = lsp_defaults.capabilities
}

lspconfig.tsserver.setup {
    on_attach = lsp_defaults.attach,
    capabilities = lsp_defaults.capabilities,
    root_dir = function(fname)
        return vim.fn.getcwd()
    end
}

lspconfig.ocamllsp.setup {
    on_attach = lsp_defaults.attach,
    capabilities = lsp_defaults.capabilities,
    root_dir = function(fname)
        return vim.fn.getcwd()
    end
}

lspconfig.hls.setup {
    on_attach = lsp_defaults.attach,
    capabilities = lsp_defaults.capabilities,
    root_dir = function(fname)
        return vim.fn.getcwd()
    end
}
lspconfig.asm_lsp.setup {
    cmd = { "asm-lsp" },
    filetypes = { "asm", "vmasm" },
    on_attach = lsp_defaults.attach,
    capabilities = lsp_defaults.capabilities,
    root_dir = function(fname)
        return vim.fn.getcwd()
    end
}
lspconfig.jdtls.setup {
    on_attach = lsp_defaults.attach,
    capabilities = lsp_defaults.capabilities,
    root_dir = function(fname)
        return vim.fn.getcwd()
    end
}

lspconfig.svls.setup {
    on_attach = lsp_defaults.attach,
    capabilities = lsp_defaults.capabilities,
    root_dir = function(fname)
        return vim.fn.getcwd()
    end
}

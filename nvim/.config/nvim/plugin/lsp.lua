local nnoremap = require("plxg.keymap").nnoremap

require("mason").setup()
require("mason-lspconfig").setup()

vim.diagnostic.config {
    underline = false
}

local lsp_defaults = {
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
    ),
    on_attach = function(client, bufnr)
        -- vim.api.nvim_command('set updatetime=100')
        --vim.api.nvim_command('autocmd CursorHold * :lua vim.lsp.buf.hover({focusable = false})')
    end,
    root_dir = function() return vim.fn.getcwd() end
}

local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config,
    lsp_defaults
)

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())


lspconfig.clangd.setup {
    on_attach = function(client, bufnr)
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
    },
    on_attach = lsp_defaults.attach,
    capabilities = lsp_defaults.capabilities
}

lspconfig.texlab.setup{
    on_attach = lsp_defaults.attach,
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

lspconfig.pyright.setup {
    on_attach = lsp_defaults.attach,
    capabilities = lsp_defaults.capabilities
}

lspconfig.ocamllsp.setup {
    on_attach = lsp_defaults.attach,
    capabilities = lsp_defaults.capabilities,
    root_dir = lsp_defaults.root_dir,
}

lspconfig.hls.setup {
    on_attach = lsp_defaults.attach,
    capabilities = lsp_defaults.capabilities,
}
lspconfig.asm_lsp.setup {
    cmd = { "asm-lsp" },
    filetypes = { "asm", "vmasm" },
    on_attach = lsp_defaults.attach,
    capabilities = lsp_defaults.capabilities,
}

lspconfig.rust_analyzer.setup {
    on_attach = lsp_defaults.attach,
    capabilities = lsp_defaults.capabilities,
    settings = {
        ['rust-analyzer'] = {
            assist = {
                importEnforceGranularity = true,
                importPrefix = 'crate',
            },
            cargo = {
                allFeatures = true,
            },
            checkOnSave = {
                command = 'clippy',
            },
            inlayHints = { locationLinks = false },
            diagnostics = {
                enable = true,
                experimental = {
                    enable = true,
                },
            },
        },
    },
    cmd = {
        "rustup",
        "run",
        "stable",
        "rust-analyzer"
    },
}

